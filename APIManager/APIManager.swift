import Foundation
import Combine

class APIManager {
    var cancellables = Set<AnyCancellable>()
    
    func get <T:Codable> (_ type: T.Type, from service: Service, _ received: @escaping ((T) -> Void)) {
        
        let request = self.request(for: service)
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .mapError { APIError.apiError(description: $0.localizedDescription) }
            .map { $0.data }
            .decode(type: type, decoder: JSONDecoder())
            .mapError { _ in APIError.decodingError }
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            },
                  receiveValue: { item in
                    received(item)
            }).store(in: &cancellables)
    }
    
    private func request(for service: Service) -> URLRequest {
        // TODO: - Prepare request for different HTTP methods
        return URLRequest(url: URL(string: service.completeStringURL)!)
    }
}






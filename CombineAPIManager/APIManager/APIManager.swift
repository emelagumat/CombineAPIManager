//
//  APIManager.swift
//  CombineAPIManager
//
//  Created by user169775 on 5/1/20.
//  Copyright © 2020 Emelagudev. All rights reserved.
//

import Foundation
import Combine

class APIManager {
    
    private func request(for service: Service) -> URLRequest {
        return URLRequest(url: URL(string: service.completeStringURL)!)
    }
    
    func get <T:Codable> (_ type: T.Type, from service: Service, _ received: @escaping ((T) -> Void)) -> AnyCancellable {
        
        let request = self.request(for: service)
        return URLSession.shared.dataTaskPublisher(for: request)
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
            })
    }
}






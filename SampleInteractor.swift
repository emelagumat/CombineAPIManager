import Combine

class SampleInteractor: ObservableObject {
    let manager = APIManager()
    
    @Published var employees: [Employee] = []
    
    func fetch() {
        manager.get(DummyDTO.self, from: .sample) { self.employees = $0.data }
    }
}

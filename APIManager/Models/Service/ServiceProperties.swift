import Foundation

extension Service: ServerRequest {
    
    // MARK: - Base URL
    var baseURL: String {
        switch self {
        case .sample:
            return "http://dummy.restapiexample.com/"
        }
    }
    
    // MARK: - API Version
    var apiVersion: String {
        switch self {
        case .sample:
            return "api/v1/"
        }
    }
    
    // MARK: - End Point
    var endPoint: String {
        switch self {
        case .sample:
            return "employees"
        }
    }
    
    // MARK: - Full URL
    var completeStringURL: String {
        return "\(baseURL)\(apiVersion)\(endPoint)"
    }
    
    // MARK: - Parameters
    var parameters: [String : Any] {
        switch self {
        case .sample:
            return [:]
        }
    }
    
    // MARK: - Method
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
}

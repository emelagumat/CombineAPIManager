import Foundation

protocol ServerRequest {
    var baseURL: String { get }
    var apiVersion: String { get }
    var endPoint: String { get }
    var completeStringURL: String { get }
    var parameters: [String: Any] { get }
    var method: HTTPMethod { get }
}


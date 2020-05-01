import Foundation

enum APIError: Error {
    case unknown
    case malformedURL
    case apiError(description: String)
    case decodingError
}

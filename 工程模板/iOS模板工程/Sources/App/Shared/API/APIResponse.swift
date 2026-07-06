import Foundation

public struct APIResponse<T: Decodable>: Decodable {
    public let code: String
    public let message: String
    public let data: T
}

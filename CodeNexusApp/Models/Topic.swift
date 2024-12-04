import Foundation

struct Topic: Identifiable, Decodable {
    let id: String
    let name: String
    let relevanceScore: Int
}

import Foundation

struct Repository: Identifiable, Decodable {
    let id: String
    let name: String
    let description: String?
    let stars: Int
    let language: String?
}

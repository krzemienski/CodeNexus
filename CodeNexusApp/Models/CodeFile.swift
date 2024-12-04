import Foundation

struct CodeFile: Identifiable, Decodable {
    let id: String
    let name: String
    let content: String
    let comments: [CodeComment]?
}

struct CodeComment: Decodable, Hashable {
    let snippet: String
    let explanation: String
}

import Foundation

struct Feedback: Identifiable, Decodable {
    let id: String
    let contentType: String
    let contentName: String
    let feedbackType: String
}

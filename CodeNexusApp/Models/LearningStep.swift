import Foundation

struct LearningStep: Identifiable, Decodable {
    let id: String
    let stepNumber: Int
    let title: String
    let description: String
}

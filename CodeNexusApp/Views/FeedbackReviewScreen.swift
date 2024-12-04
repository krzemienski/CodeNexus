import SwiftUI

struct FeedbackReviewScreen: View {
    @State private var feedbacks: [Feedback] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Loading feedback history...")
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List {
                        ForEach(feedbacks) { feedback in
                            VStack(alignment: .leading) {
                                Text("Content: \(feedback.contentName)")
                                    .font(.headline)
                                Text("Type: \(feedback.contentType)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("Feedback: \(feedback.feedbackType)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                HStack {
                                    Button("Edit") {
                                        editFeedback(feedback)
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                    .foregroundColor(.blue)
                                    Button("Delete") {
                                        deleteFeedback(feedback)
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                    .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Feedback Review")
        }
        .onAppear(perform: loadFeedbackHistory)
    }

    private func loadFeedbackHistory() {
        isLoading = true
        let backendURL = URL(string: "http://localhost:8080/feedback/history")!

        URLSession.shared.dataTask(with: backendURL) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false

                if let error = error {
                    errorMessage = "Error loading feedback: \(error.localizedDescription)"
                    return
                }

                guard let data = data,
                      let response = try? JSONDecoder().decode([Feedback].self, from: data) else {
                    errorMessage = "Invalid data format."
                    return
                }

                feedbacks = response
            }
        }.resume()
    }

    private func editFeedback(_ feedback: Feedback) {
        // Implement edit functionality
        print("Editing feedback for \(feedback.id)")
    }

    private func deleteFeedback(_ feedback: Feedback) {
        guard let deleteURL = URL(string: "http://localhost:8080/feedback/delete/\(feedback.id)") else { return }

        var request = URLRequest(url: deleteURL)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { _, _, _ in
            DispatchQueue.main.async {
                feedbacks.removeAll { $0.id == feedback.id }
            }
        }.resume()
    }
}

struct Feedback: Identifiable, Decodable {
    let id: String
    let contentType: String
    let contentName: String
    let feedbackType: String
}
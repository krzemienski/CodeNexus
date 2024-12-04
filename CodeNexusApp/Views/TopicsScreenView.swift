import SwiftUI

struct TopicsScreenView: View {
    @State private var topics: [Topic] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if isLoading {
                        ProgressView("Loading topics...")
                    } else if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        ForEach(topics) { topic in
                            TopicRow(topic: topic, onFeedback: { feedbackType in
                                sendFeedback(for: topic.id, type: feedbackType)
                            })
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Topics")
        }
        .onAppear(perform: loadTopics)
    }

    private func loadTopics() {
        isLoading = true
        let backendURL = URL(string: "http://localhost:3000/topics")!

        URLSession.shared.dataTask(with: backendURL) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false

                if let error = error {
                    errorMessage = "Error loading topics: \(error.localizedDescription)"
                    return
                }

                guard let data = data,
                      let response = try? JSONDecoder().decode([Topic].self, from: data) else {
                    errorMessage = "Invalid data format."
                    return
                }

                topics = response
            }
        }.resume()
    }

    private func sendFeedback(for topicID: String, type: String) {
        guard let feedbackURL = URL(string: "http://localhost:3000/topics/feedback") else { return }

        var request = URLRequest(url: feedbackURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["topic_id": topicID, "feedback_type": type]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request).resume()
    }
}

struct TopicRow: View {
    let topic: Topic
    let onFeedback: (String) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(topic.name)
                .font(.headline)
            Text("Relevance Score: \(topic.relevanceScore)")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                Button(action: { onFeedback("useful") }) {
                    Text("Useful")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                Button(action: { onFeedback("not_useful") }) {
                    Text("Not Useful")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

struct Topic: Identifiable, Decodable {
    let id: String
    let name: String
    let relevanceScore: Int
}
import SwiftUI

struct RepositoryScreenView: View {
    @State private var repositories: [Repository] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if isLoading {
                        ProgressView("Loading repositories...")
                    } else if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        ForEach(repositories) { repo in
                            RepositoryDetailRow(repository: repo, onFeedback: { feedbackType in
                                sendFeedback(for: repo.id, type: feedbackType)
                            })
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Repositories")
        }
        .onAppear(perform: loadRepositories)
    }

    private func loadRepositories() {
        isLoading = true
        let backendURL = URL(string: "http://localhost:8080/repositories")!

        URLSession.shared.dataTask(with: backendURL) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false

                if let error = error {
                    errorMessage = "Error loading repositories: \(error.localizedDescription)"
                    return
                }

                guard let data = data,
                      let response = try? JSONDecoder().decode([Repository].self, from: data) else {
                    errorMessage = "Invalid data format."
                    return
                }

                repositories = response
            }
        }.resume()
    }

    private func sendFeedback(for repositoryID: String, type: String) {
        guard let feedbackURL = URL(string: "http://localhost:8080/repositories/feedback") else { return }

        var request = URLRequest(url: feedbackURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["repository_id": repositoryID, "feedback_type": type]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request).resume()
    }
}

struct RepositoryDetailRow: View {
    let repository: Repository
    let onFeedback: (String) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(repository.name)
                .font(.headline)
            Text(repository.description ?? "No description available")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Relevance Score: \(repository.relevanceScore)")
                .font(.caption)
                .foregroundColor(.secondary)

            HStack {
                Button(action: { onFeedback("relevant") }) {
                    Text("Relevant")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                Button(action: { onFeedback("not_relevant") }) {
                    Text("Not Relevant")
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

struct Repository: Identifiable, Decodable {
    let id: String
    let name: String
    let description: String?
    let relevanceScore: Int
}
import SwiftUI

struct HomeScreenView: View {
    @State private var trendingTopics: [String] = []
    @State private var recommendedRepositories: [Repository] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if isLoading {
                        ProgressView("Loading...")
                    } else {
                        if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding()
                        } else {
                            Group {
                                Text("Trending Topics")
                                    .font(.headline)
                                    .padding(.horizontal)

                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) {
                                        ForEach(trendingTopics, id: \.self) { topic in
                                            Text(topic)
                                                .padding()
                                                .background(Color.gray.opacity(0.2))
                                                .cornerRadius(10)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }

                            Group {
                                Text("Recommended Repositories")
                                    .font(.headline)
                                    .padding(.horizontal)

                                ForEach(recommendedRepositories) { repo in
                                    RepositoryRow(repository: repo)
                                }
                            }
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Home")
        }
        .onAppear(perform: loadHomeData)
    }

    private func loadHomeData() {
        isLoading = true
        let backendURL = URL(string: "http://localhost:3000/home")!

        URLSession.shared.dataTask(with: backendURL) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false

                if let error = error {
                    errorMessage = "Error loading data: \(error.localizedDescription)"
                    return
                }

                guard let data = data,
                      let response = try? JSONDecoder().decode(HomeResponse.self, from: data) else {
                    errorMessage = "Invalid data format."
                    return
                }

                trendingTopics = response.trendingTopics
                recommendedRepositories = response.recommendedRepositories
            }
        }.resume()
    }
}

struct RepositoryRow: View {
    let repository: Repository

    var body: some View {
        VStack(alignment: .leading) {
            Text(repository.name)
                .font(.headline)
            Text(repository.description ?? "No description available")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("⭐️ \(repository.stars) • \(repository.language ?? "Unknown")")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

struct HomeResponse: Decodable {
    let trendingTopics: [String]
    let recommendedRepositories: [Repository]
}

struct Repository: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let stars: Int
    let language: String?
}
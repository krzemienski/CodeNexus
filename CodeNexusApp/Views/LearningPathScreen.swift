import SwiftUI

struct LearningPathScreen: View {
    @State private var learningSteps: [LearningStep] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Generating learning path...")
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List {
                        ForEach(learningSteps) { step in
                            VStack(alignment: .leading) {
                                Text("Step \(step.stepNumber): \(step.title)")
                                    .font(.headline)
                                Text(step.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical)
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Learning Path")
        }
        .onAppear(perform: loadLearningPath)
    }

    private func loadLearningPath() {
        isLoading = true
        let backendURL = URL(string: "http://localhost:8080/learning-path")!

        URLSession.shared.dataTask(with: backendURL) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false

                if let error = error {
                    errorMessage = "Error loading learning path: \(error.localizedDescription)"
                    return
                }

                guard let data = data,
                      let response = try? JSONDecoder().decode([LearningStep].self, from: data) else {
                    errorMessage = "Invalid data format."
                    return
                }

                learningSteps = response
            }
        }.resume()
    }
}

struct LearningStep: Identifiable, Decodable {
    let id: String
    let stepNumber: Int
    let title: String
    let description: String
}
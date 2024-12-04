import SwiftUI

struct CodeViewerScreen: View {
    @State private var files: [CodeFile] = []
    @State private var selectedFile: CodeFile?
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Loading files...")
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List {
                        ForEach(files) { file in
                            Button(action: {
                                selectedFile = file
                            }) {
                                Text(file.name)
                                    .font(.headline)
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .sheet(item: $selectedFile) { file in
                CodeDetailView(file: file)
            }
            .navigationTitle("Code Viewer")
        }
        .onAppear(perform: loadCodeFiles)
    }

    private func loadCodeFiles() {
        isLoading = true
        let backendURL = URL(string: "http://localhost:8080/code/files")!

        URLSession.shared.dataTask(with: backendURL) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false

                if let error = error {
                    errorMessage = "Error loading files: \(error.localizedDescription)"
                    return
                }

                guard let data = data,
                      let response = try? JSONDecoder().decode([CodeFile].self, from: data) else {
                    errorMessage = "Invalid data format."
                    return
                }

                files = response
            }
        }.resume()
    }
}

struct CodeDetailView: View {
    let file: CodeFile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(file.name)
                    .font(.title)
                    .padding(.bottom)

                Text(file.content)
                    .font(.system(.body, design: .monospaced))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                if let comments = file.comments {
                    ForEach(comments, id: \.self) { comment in
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Snippet:")
                                .font(.headline)
                            Text(comment.snippet)
                                .font(.system(.body, design: .monospaced))
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)

                            Text("Explanation:")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(comment.explanation)
                                .font(.body)
                        }
                        .padding(.vertical)
                    }
                }
            }
            .padding()
        }
    }
}

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
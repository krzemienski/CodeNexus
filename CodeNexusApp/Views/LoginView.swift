import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @State private var isAuthenticated = false
    @State private var authSession: ASWebAuthenticationSession?
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            if isAuthenticated {
                Text("Welcome to CodeNexus.ai")
                    .font(.title)
                    .padding()
            } else {
                Text("Login to CodeNexus.ai")
                    .font(.headline)
                    .padding()

                Button(action: {
                    authenticateWithGitHub()
                }) {
                    Text("Login with GitHub")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Button(action: {
                    proceedAsGuest()
                }) {
                    Text("Continue as Guest")
                        .foregroundColor(.blue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .border(Color.blue, width: 1)
                }
                .padding()
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
        .padding()
    }
    
    private func authenticateWithGitHub() {
        let clientId = "YOUR_CLIENT_ID"
        let redirectUri = "YOUR_REDIRECT_URI"
        let authURL = URL(string: "https://github.com/login/oauth/authorize?client_id=\(clientId)&redirect_uri=\(redirectUri)&scope=read:user")!
        
        authSession = ASWebAuthenticationSession(url: authURL, callbackURLScheme: redirectUri) { callbackURL, error in
            if let error = error {
                self.errorMessage = "Authentication failed: \(error.localizedDescription)"
                return
            }
            if let callbackURL = callbackURL, let queryItems = URLComponents(url: callbackURL, resolvingAgainstBaseURL: false)?.queryItems {
                let token = queryItems.first { $0.name == "code" }?.value
                fetchAccessToken(authCode: token)
            }
        }
        authSession?.start()
    }
    
    private func fetchAccessToken(authCode: String?) {
        guard let authCode = authCode else {
            self.errorMessage = "Invalid authorization code."
            return
        }
        
        let tokenURL = URL(string: "https://github.com/login/oauth/access_token")!
        var request = URLRequest(url: tokenURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let body = ["client_id": "YOUR_CLIENT_ID", "client_secret": "YOUR_CLIENT_SECRET", "code": authCode]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.errorMessage = "Error fetching access token: \(error.localizedDescription)"
                return
            }
            
            guard let data = data,
                  let response = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let accessToken = response["access_token"] as? String else {
                self.errorMessage = "Invalid access token response."
                return
            }
            
            DispatchQueue.main.async {
                self.isAuthenticated = true
            }
            print("Access Token: \(accessToken)")
        }.resume()
    }
    
    private func proceedAsGuest() {
        isAuthenticated = true
    }
}
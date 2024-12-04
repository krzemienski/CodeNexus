
# **CodeNexus.ai**

### **Your Gateway to Mastering Code**

CodeNexus.ai is an AI-driven platform designed to help engineers explore, learn, and master code by creating a nexus of curated repositories and topics. It combines powerful local and cloud-based AI systems with GitHub's vast repository ecosystem to enhance your coding journey.

---

## **Table of Contents**

1. [Overview](#overview)
2. [Features](#features)
3. [System Architecture](#system-architecture)
   - [System Component Diagram](#system-component-diagram)
   - [AI Tier Integration](#ai-tier-integration)
4. [User Flow](#user-flow)
   - [Screens](#screens)
   - [User Flow Diagram](#user-flow-diagram)
5. [Future Enhancements](#future-enhancements)
6. [Development Plan](#development-plan)
7. [Diagrams](#diagrams)

---

## **Overview**

CodeNexus.ai is built to empower developers to:
- **Explore** topics and repositories of interest.
- **Learn** from AI-curated repository insights.
- **Create** a personalized nexus of repositories for long-term mastery.

The app offers three tiers of AI integration:
1. **Local AI**: On-device processing for quick and offline tasks.
2. **Custom LLM**: Your custom-trained open-source LLM for intermediate analysis.
3. **Third-Party AI**: Advanced, resource-intensive tasks handled by APIs like OpenAI.

---

## **Features**

- **Topic Exploration**: Browse GitHub topics and discover repositories based on your interests.
- **Repository Insights**: Gain AI-driven insights, including summaries, tutorials, and suggested learning paths.
- **Code Viewing**: Read and analyze code directly in the app with syntax highlighting and inline AI assistance.
- **Nexus Creation**: Curate your personalized collection of repositories for further study.
- **Settings and Customization**: Adjust preferences, including themes, AI usage, and account settings.

---

## **System Architecture**

CodeNexus.ai is built around a modular architecture for scalability and performance.

### **System Component Diagram**

Below is the system component diagram showing the key components and their interactions.

![System Component Diagram](system_component_diagram.png)

- **Frontend**: The iOS and Web applications provide the user interface and interact with the backend.
- **Backend**: Manages API calls, authentication, and routing requests to AI services.
- **AI Tiers**:
  - Local AI for lightweight tasks.
  - Custom LLM for mid-tier processing.
  - Third-Party AI for heavy computational tasks.
- **External Services**: GitHub API for accessing repositories and topics.

### **AI Tier Integration**

- **Local AI**: Processes syntax highlighting and small-scale analyses offline.
- **Custom LLM**: Trained on open-source data for contextual repository insights.
- **Third-Party AI**: Executes complex tasks like generating tutorials or learning paths.

---

## **User Flow**

### 1. Login Screen

### Components:
- Username/Email Input Field
- Password Input Field
- “Forgot Password?” Link
- Login Button
- OAuth Login Options (e.g., GitHub, Google)

### Layout:
- **Header**: App Logo/Name centered at the top.
- **Input Fields**: Vertically aligned for Username/Email and Password.
- **Buttons**: Login button prominent below input fields, with OAuth options arranged horizontally or stacked.
- **Footer**: “Forgot Password?” link below the login button.

### Notes:
- Include proper labels, error messages for validation.
- Accessible tab navigation for all interactive elements.

---

### 2. Home Screen

### Purpose:
Central hub for navigation.

### Components:
- **Dashboard**: Key stats like repositories, progress bars for learning paths.
- **Navigation Menu**: Links to Topics, Repositories, Settings.
- **Quick Access Tiles**: “Recently Viewed” or “Favorites” sections.

### Layout:
- **Header**: Navigation menu across the top.
- **Body**: Main area divided into three sections:
  - Left: Key stats dashboard.
  - Center: Quick access tiles.
  - Right: Additional recommendations or notifications.
- **Footer**: Persistent bottom navigation for mobile views.

### Notes:
- Responsive design for seamless desktop and mobile transitions.

---

### 3. Topics Screen

### Purpose:
Browse and select learning or coding topics.

### Components:
- Search Bar
- List/Grid of Topics: Icons and short descriptions for each topic.
- Filtering Options: Dropdowns or toggles for difficulty and category.
- Call-to-Action Buttons: “Start Learning,” “View Resources.”

### Layout:
- **Header**: Search bar with filtering options below it.
- **Body**: Grid or list layout for topics with icons.
- **Footer**: Fixed navigation.

---

### 4. Repository Screen

### Purpose:
Displays user-linked repositories.

### Components:
- Search Bar
- List of Repositories: Metadata like stars, forks, last updated.
- Tabs: “Private” and “Public” repositories.
- Integration Options: Buttons for connecting/disconnecting GitHub or adding new repositories.

### Layout:
- **Header**: Tabs for repository type.
- **Body**: Search bar above the list of repositories.
- **Footer**: Persistent action buttons for integrations.

---

### 5. Code Viewer Screen

### Purpose:
View and analyze code files.

### Components:
- File Directory Tree: Positioned on the left.
- Main Code Editor Area: Center with syntax highlighting.
- Toolbar: Above editor for actions (Copy, Download, Comment).
- AI Insights: Sidebar for “Run Code” or AI-generated suggestions.

### Layout:
- **Three-column design**:
  - Left: File tree.
  - Center: Code editor.
  - Right: Toolbar and AI insights panel.
- **Header**: Repository name and navigation breadcrumbs.

---

### 6. Learning Path Screen

### Purpose:
Track learning progress.

### Components:
- List of Learning Paths: Progress bars for each.
- Recommendation Engine: Carousel or list for new paths.
- Start New Path Button
- Achievements Section: Badges or milestone display.

### Layout:
- **Header**: Search or filter for learning paths.
- **Body**: Two-column layout:
  - Left: Ongoing learning paths.
  - Right: Recommendations or achievements.

---

### 7. Settings Screen

### Purpose:
Manage user preferences.

### Components:
- Profile Settings: Username, email, and avatar.
- API Integrations: GitHub and third-party APIs.
- Theme Toggle: Light/Dark mode switch.
- Data Management: Options like clear cache, manage storage.

### Layout:
- **Header**: Tabs for different settings categories.
- **Body**: Stacked settings options.
- **Footer**: Save/Apply button.

---

### Cross-Screen Design Notes:
- Consistent typography and spacing for visual harmony.
- High contrast for accessibility.
- Responsive layouts with mobile-first considerations.

- **Login Flow**: Authenticates the user and sets up access tokens.
- **Data Flow**: Screens communicate with the API Gateway to retrieve data from GitHub or AI services.
- **AI Flow**: Determines whether to use Local AI, Custom LLM, or Third-Party APIs based on task complexity.

---

## **Future Enhancements**

1. **Collaborative Nexuses**: Share curated repository collections with peers.
2. **Gamification**: Track learning progress and unlock achievements.
3. **Offline Mode Expansion**: Extend Local AI capabilities for fully offline usage.
4. **Community Contributions**: Create public nexuses for shared learning paths.

---

## **Development Plan**

1. **Frontend**:
   - Build with SwiftUI for iOS.
   - React.js for the web application.
2. **Backend**:
   - Node.js or Python-based backend for API routing.
   - PostgreSQL for data storage and Redis for caching.
3. **AI Integration**:
   - Implement Local AI using CoreML or TensorFlow Lite.
   - Deploy a fine-tuned LLaMA model on self-hosted servers.
   - Integrate third-party APIs like OpenAI for advanced features.
4. **Testing**:
   - Unit tests for backend services and AI tiers.
   - UI testing for frontend applications.

---

## **Diagrams**

### **System Component Diagram**

![System Component Diagram](system_component_diagram.png)

### **User Flow Diagram**

![User Flow Diagram](user_flow_diagram.png)

---

CodeNexus.ai

CodeNexus.ai is a powerful platform designed to help engineers explore GitHub repositories, analyze relevant code snippets, and learn specific topics using AI-driven insights. This repository contains both the iOS application and the backend server, each designed for modular and scalable development.

Project Structure

1. iOS Application

The iOS app is developed using Swift and SwiftUI. It includes frontend screens for user interaction and integrates seamlessly with the backend services.

Directory Overview

📂 CodeNexusApp
├── 📂 Views
│   ├── LoginView.swift
│   ├── HomeScreenView.swift
│   ├── TopicsScreenView.swift
│   ├── RepositoryScreenView.swift
│   ├── CodeViewerScreen.swift
│   └── LearningPathScreen.swift
├── 📂 Models
│   ├── Topic.swift
│   ├── Repository.swift
│   ├── CodeFile.swift
│   ├── LearningStep.swift
│   └── Feedback.swift
├── 📂 Services
│   ├── APIService.swift
│   └── AuthService.swift
└── 📄 CodeNexusApp.swift

Key Files

	•	Views/
	•	LoginView.swift: Manages user authentication via GitHub OAuth or guest mode.
	•	HomeScreenView.swift: Displays trending topics and recommended repositories.
	•	TopicsScreenView.swift: Allows users to browse and provide feedback on GitHub topics.
	•	RepositoryScreenView.swift: Shows repository metadata and relevance scores.
	•	CodeViewerScreen.swift: Displays repository files with syntax highlighting and AI-generated comments.
	•	LearningPathScreen.swift: Provides AI-generated step-by-step guides.
	•	Models/
	•	Topic.swift, Repository.swift, CodeFile.swift, LearningStep.swift, Feedback.swift: Define data models for the app.
	•	Services/
	•	APIService.swift: Handles communication with the backend server.
	•	AuthService.swift: Manages GitHub OAuth authentication.
	•	CodeNexusApp.swift: Entry point for the iOS app.

2. Backend Server

The backend is developed using Vapor (Swift-based web framework) and provides RESTful APIs for the iOS app. It includes services for AI task routing, feedback management, and more.

Directory Overview

📂 CodeNexusBackend
├── 📂 Sources
│   ├── 📂 App
│   │   ├── Controllers
│   │   │   ├── AITaskRouter.swift
│   │   │   └── FeedbackController.swift
│   │   ├── Models
│   │   │   ├── Feedback.swift
│   │   │   ├── LearningStep.swift
│   │   │   ├── CodeFile.swift
│   │   │   ├── Repository.swift
│   │   │   └── Topic.swift
│   │   ├── Routes
│   │   │   ├── FeedbackRoutes.swift
│   │   │   ├── LearningPathRoutes.swift
│   │   │   ├── RepositoryRoutes.swift
│   │   │   └── AITaskRoutes.swift
│   │   └── configure.swift
├── 📂 Tests
│   ├── AITaskRouterTests.swift
│   ├── FeedbackRoutesTests.swift
│   └── RepositoryRoutesTests.swift
├── 📄 Package.swift
├── 📄 Dockerfile
└── 📄 README.md

Key Files

	•	Controllers/
	•	AITaskRouter.swift: Routes AI-related tasks (recommendations, summarization, learning paths) to appropriate logic.
	•	FeedbackController.swift: Handles feedback-related operations.
	•	Models/
	•	Feedback.swift, LearningStep.swift, CodeFile.swift, Repository.swift, Topic.swift: Define data models for the backend.
	•	Routes/
	•	FeedbackRoutes.swift: Exposes endpoints for fetching and managing user feedback.
	•	LearningPathRoutes.swift: Exposes endpoints for generating AI-driven learning paths.
	•	RepositoryRoutes.swift: Handles repository metadata and feedback.
	•	AITaskRoutes.swift: Provides endpoints for AI tasks like recommendations and summarization.
	•	Tests/
	•	AITaskRouterTests.swift: Unit tests for AI task routing.
	•	FeedbackRoutesTests.swift, RepositoryRoutesTests.swift: Integration tests for feedback and repository routes.
	•	Package.swift: Defines dependencies for the Vapor backend.
	•	Dockerfile: Enables containerization of the backend for deployment.

Features

Frontend (iOS App)

	•	Login: GitHub OAuth integration or guest mode.
	•	Home: Displays trending GitHub topics and repositories.
	•	Topics: Allows users to browse and rate GitHub topics.
	•	Repository Viewer: Displays repository metadata and AI-generated insights.
	•	Code Viewer: Provides syntax-highlighted code with inline AI comments.
	•	Learning Path: Generates personalized step-by-step guides.

Backend (Vapor Server)

	•	AI Task Router: Handles AI tasks (recommendations, summarization, learning paths) using mock or third-party AI models.
	•	Feedback Management: Records and updates user feedback.
	•	Repository Insights: Provides metadata and relevance scores for GitHub repositories.
	•	Learning Path Generation: Generates personalized learning paths based on user-defined goals.

Getting Started

1. iOS App

	1.	Open CodeNexusApp.xcodeproj in Xcode.
	2.	Run the app on a simulator or device.
	3.	Ensure the backend server is running locally or deployed.

2. Backend Server

	1.	Install dependencies:

swift package resolve


	2.	Run the server:

vapor run


	3.	Test APIs via Postman or directly from the app.

3. Docker Deployment

	1.	Build the backend image:

docker build -t codenexus-backend .


	2.	Run the container:

docker run -p 8080:8080 codenexus-backend

API Endpoints

1. Feedback

	•	GET /feedback/history: Fetches user feedback history.
	•	DELETE /feedback/delete/:id: Deletes a specific feedback entry.

2. Repositories

	•	GET /repositories: Fetches repository metadata.
	•	POST /repositories/feedback: Records user feedback on repositories.

3. AI Tasks

	•	GET /ai/recommendations: Fetches AI-driven recommendations.
	•	GET /ai/summarization: Summarizes code files.
	•	GET /ai/learning-path: Generates an AI-driven learning path.

Contributing

Feel free to contribute to CodeNexus.ai by:
	1.	Forking the repository.
	2.	Creating feature branches.
	3.	Submitting pull requests.

License

CodeNexus.ai is licensed under the MIT License. See the LICENSE file for details.
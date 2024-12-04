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

This README.md provides a detailed guide for setting up, testing, and deploying CodeNexus.ai. Let me know if you need additional details!
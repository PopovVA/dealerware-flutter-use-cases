# Dealerware Flutter Use Cases

A Flutter demo project showcasing **REST**, **GraphQL**, and **WebSocket** integrations with multiple CI/CD pipelines.

## 🚀 Purpose

This repository demonstrates how to build a scalable Flutter mobile application that integrates different data APIs (REST + GraphQL) and supports real-time communication via WebSockets.  
It also includes three CI/CD configurations:
- **GitHub Actions**
- **Jenkins + Fastlane**
- **Codemagic**

The goal is to simulate realistic Dealerware-style use cases, focusing on fast iteration, strong architecture, and reliable delivery pipelines.

## 🧩 Tech Stack

- **Flutter** (Android & iOS)
- **Riverpod** for state management
- **Dio** for REST API
- **GraphQL Flutter** for queries, mutations, and subscriptions
- **WebSocket** for real-time updates
- **Fastlane / GitHub Actions / Codemagic** for CI/CD automation

## 🛠 Getting Started

1. Install Flutter (latest stable).
2. Clone this repository:
   ```bash
   git clone https://github.com/vadimpopov/dealerware-flutter-use-cases.git
   cd dealerware-flutter-use-cases
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## 🧪 CI/CD

Each pipeline automates build, test, and release:
- **GitHub Actions**: cloud-based builds and releases.
- **Jenkins + Fastlane**: local automation for Android/iOS.
- **Codemagic**: hosted mobile CI with automatic signing and publishing.

---

## Out of scope

Localization
Naviigation
Cache


Created by Vadim Popov

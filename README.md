[![Codemagic build status](https://api.codemagic.io/apps/68f5642276e25aaf7e9940b6/68f5642276e25aaf7e9940b5/status_badge.svg)](https://codemagic.io/app/68f5642276e25aaf7e9940b6/68f5642276e25aaf7e9940b5/latest_build)
[![Tests](https://github.com/vadimpopov/dealerware-flutter-use-cases/actions/workflows/tests.yml/badge.svg)](https://github.com/vadimpopov/dealerware-flutter-use-cases/actions/workflows/tests.yml)

# Dealerware Flutter Use Cases

A Flutter demo project showcasing **REST**, **GraphQL**, and **WebSocket** integrations with CI/CD pipelines.

## 🚀 Purpose

This repository demonstrates how to build a scalable Flutter mobile application that integrates different data APIs (REST + GraphQL) and supports real-time communication via WebSockets.  
It also includes three CI/CD configurations:

- **GitHub Actions**
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

## 🧪 Testing

Run unit tests:

```bash
flutter test
```

## 🧪 CI/CD

Each pipeline automates build, test, and release:

- **GitHub Actions**: run unit tests.
- **Codemagic**: hosted mobile CI with automatic signing and publishing.

---

## Out of scope

Localization
Naviigation
Cache

Created by Vadim Popov

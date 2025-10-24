[![Codemagic build status](https://api.codemagic.io/apps/68f5642276e25aaf7e9940b6/68f5642276e25aaf7e9940b5/status_badge.svg)](https://codemagic.io/app/68f5642276e25aaf7e9940b6/68f5642276e25aaf7e9940b5/latest_build)
[![Tests](https://github.com/PopovVA/dealerware-flutter-use-cases/workflows/Tests/badge.svg)](https://github.com/PopovVA/dealerware-flutter-use-cases/actions/workflows/tests.yml)

# Dealerware Flutter Use Cases

A Flutter demo project showcasing **REST**, **GraphQL**, and integrations with CI/CD pipelines.

## 🚀 Purpose

This repository demonstrates how to build a scalable Flutter mobile application that integrates different data APIs (REST + GraphQL) and supports real-time communication via WebSockets.  
It also includes CI/CD configurations:

- **GitHub Actions**
- **Codemagic**

The goal is to simulate realistic Dealerware-style use cases, focusing on fast iteration, strong architecture, and reliable delivery pipelines.

## 🧩 Tech Stack

- **Flutter** (Android & iOS)
- **Riverpod** for state management
- **Dio** for REST API
- **GraphQL Flutter** for queries, mutations
- **GitHub Actions / Codemagic** for CI/CD automation

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

- **GitHub Actions**: runs unit tests.
- **Codemagic**: hosted mobile CI with automatic signing and publishing.

---

## Out of scope

This project focuses on architecture, API integrations, and CI/CD. The following features were intentionally not implemented:

- **Navigation**: No advanced navigation patterns (no router, deep linking)
- **Localization**: English only, no i18n/l10n
- **Animations**: Minimal animations, basic Flutter transitions only
- **UI/UX Polish**: Simple, functional UI without custom design system
- **Caching**: No offline support or data persistence
- **WebSockets**: Planned but not implemented

The goal is to demonstrate clean architecture and API integration patterns, not a production-ready UI.

---

Created by Vadim Popov

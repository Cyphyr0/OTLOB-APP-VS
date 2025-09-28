### **Section 2: Frontend Tech Stack**

| Category | Technology | Version | Purpose | Rationale |
| :--- | :--- | :--- | :--- | :--- |
| Framework | Flutter | Latest Stable | Core application framework | Project requirement. Provides cross-platform native performance. |
| State Management | `flutter_bloc` | Latest | Manages application state | Promotes clean architecture by separating UI from business logic. Highly scalable and testable. |
| Routing | `go_router` | Latest | Handles navigation and deep linking | Maintained by the Flutter team. Excellent support for deep linking. |
| API Integration | `dio` | Latest | HTTP client for backend communication | Powerful and flexible, with support for interceptors. |
| Testing | `flutter_test` / `integration_test` | SDK | Unit, widget, and integration testing | Standard, built-in testing frameworks for Flutter. |
| PDF Generation | `pdf` | Latest | Creates downloadable PDF receipts | A powerful library for generating PDF documents in Dart. |
| Local Storage | `shared_preferences` | Latest | Persists simple key-value data | For storing auth token and user preferences. |
| Service Locator | `get_it` | Latest | Dependency injection | Decouples classes and allows for easy mocking in tests. |
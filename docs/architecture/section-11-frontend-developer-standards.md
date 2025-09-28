### **Section 11: Frontend Developer Standards**

#### **Critical Coding Rules**
1.  **State Management:** Use Cubit for simple state, BLoC for complex flows. State must be immutable.
2.  **Styling:** No hardcoded styles. Use `Theme.of(context)`.
3.  **API Calls:** Must go through the `Repository -> DataSource` abstraction.
4.  **Configuration:** Use the `Config` class.
5.  **Widgets:** Prefer `StatelessWidget` and `const`.
6.  **Testing:** All new features must have tests.
7.  **Null Safety:** No `!` operator.

#### **Quick Reference Guide**
*   **Commands:** `flutter run --flavor dev`, `flutter test --coverage`
*   **Imports:** Use absolute imports (`package:otlob/...`).
*   **Architecture:** UI -> BLoC -> Usecase -> Repository -> DataSource -> API
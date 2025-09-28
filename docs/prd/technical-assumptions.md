### **Section 4: Technical Assumptions**

#### **Repository Structure: Polyrepo**
The project will use a poly-repository structure. The Flutter front-end application will reside in its own dedicated repository, and the .NET back-end service will reside in a separate repository. This provides a clean separation of concerns between the two parts of the project.

#### **Service Architecture: Decoupled Client-Server**
The high-level architecture is a decoupled client-server model. The Flutter application acts as a pure client, responsible only for the user interface and user experience. All business logic, data storage, and third-party integrations (like payment gateways) are handled by the separate .NET back-end service, which exposes its functionality via a web API.

#### **Testing Requirements: Unit & Integration Testing**
The testing strategy will focus on two key areas to ensure quality and correctness:
*   **Unit Testing:** To verify individual Flutter widgets, business logic classes (e.g., state management), and utility functions in isolation.
*   **Integration Testing:** To verify the integration between the Flutter application and the .NET API, ensuring that data is being sent and received correctly.

#### **Additional Technical Assumptions**
*   A robust state management solution (e.g., BLoC, Riverpod) will be chosen and implemented consistently across the Flutter application to manage app state efficiently.

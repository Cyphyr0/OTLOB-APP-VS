# Otlob Product Requirements Document (PRD)

### **Section 1: Goals and Background Context**

#### **Goals**
*   To deliver a feature-complete, polished "Version 1.0" of the Otlob app that meets all university graduation project requirements.
*   To solve the "choice paralysis" and "erosion of trust" faced by users of existing food delivery platforms.
*   To provide a platform that champions local, authentic Egyptian restaurants and helps them gain visibility.
*   To create a delightful, premium, and trustworthy user experience that makes discovering food an exciting and frictionless process.

#### **Background Context**
The current food delivery market in Egypt presents a dual-sided problem: users are overwhelmed with inauthentic choices and untrustworthy reviews, while high-quality local restaurants are lost in the noise. Existing platforms, designed around advertising, fail to serve the user's desire for authentic discovery or the local restaurant's need for a level playing field.

Otlob addresses this gap by creating a trusted, community-driven ecosystem. By focusing on unique, trust-building features like the 'Tawseya' recommendation system and a fair dual-rating model, the platform aims to become the definitive guide for "Urban Explorers" seeking genuine culinary experiences, while simultaneously celebrating and elevating local culinary heroes.

#### **Change Log**

| Date | Version | Description | Author |
| :--- | :--- | :--- | :--- |
| 26 Sep 2025 | 1.0 | Initial draft of PRD based on approved Project Brief. | John, Product Manager |

---
### **Section 2: Requirements**

#### **Functional Requirements**
FR1: The system must allow users to sign up or log in using their email address or a social media account.
FR2: The system must automatically detect the user's location via GPS and allow for manual address entry and management.
FR3: The system must provide core discovery features, including a home screen list, search for restaurants/dishes, and basic filtering.
FR4: The system must display a restaurant profile page with essential information, menu, and user reviews.
FR5: The system must provide an interactive menu, allowing users to browse categories and view item details.
FR6: The system must allow users to add items to a shopping cart and include special text-based instructions for an order.
FR7: The system must provide a seamless checkout process, including cart review, address confirmation, and selection of payment method (COD, Digital).
FR8: The system must display a live order tracking screen showing the order status (e.g., Placed, Preparing, Delivery, Delivered).
FR9: The system must provide basic user account management for name and saved addresses.
FR10: The system must maintain a detailed history of the user's past orders.
FR11: The system must allow users to reorder a past meal with a single tap from the order history.
FR12: The system must allow users to maintain a personal list of favorite dishes.
FR13: The system must implement a dual-rating system, allowing users to rate the food and the delivery experience separately.
FR14: The system must send push notifications to the user for critical order status changes.
FR15: The system must display curated carousels on the home screen (e.g., 'Hidden Gems', 'Local Heroes').
FR16: The system must feature a "Surprise Me!" button that provides a single, fun restaurant recommendation.
FR17: The system must implement the 'Tawseya' recommendation system, granting each user one vote per month to endorse a restaurant.
FR18: The system must allow users to share a link to a specific menu item with others.
FR19: The system must generate a styled, professional-looking digital receipt upon order confirmation and in the order history.
FR20: The system must allow users to download their receipts as a PDF or Image file from their order history.

#### **Non-Functional Requirements**
NFR1: **Performance:** The application must feel fast and responsive, maintaining 60fps during all UI animations and transitions to deliver a premium, native feel.
NFR2: **Usability:** The application must be highly intuitive, allowing a first-time user to seamlessly navigate from discovery to a placed order with minimal friction or confusion.
NFR3: **Visual Design:** The application's UI must be visually rich, clean, and appetizing, reflecting a premium and trustworthy brand identity.
NFR4: **Reliability:** The application must be stable, with a target crash-free user rate of over 99.5%.
NFR5: **Security:** All communication between the client and the backend API must be encrypted via HTTPS. User authentication tokens must be stored securely on the device.
NFR6: **Compatibility:** The application must support modern versions of its target platforms, specifically iOS 14+ and Android 8.0+.

---
### **Section 3: User Interface Design Goals**

#### **Overall UX Vision**
The user experience must be premium, trustworthy, and delightful. The app should feel less like a utility and more like a personal food concierge—a knowledgeable friend who shares the city's best-kept secrets. The core principles are:
*   **Effortless & Intuitive:** Navigation should be invisible, and the journey from discovery to order should be frictionless.
*   **Visually Rich & Appetizing:** The UI must be a feast for the eyes, using high-quality photography, a clean layout, and beautiful typography to make the food the hero.

#### **Key Interaction Paradigms**
*   **Visually-Driven Discovery:** Users will primarily discover content through engaging visuals, such as curated carousels and high-quality dish images.
*   **Gesture-Based Navigation:** The app will utilize standard, intuitive mobile gestures for scrolling, swiping, and navigating, ensuring a smooth and responsive feel.
*   **Minimalist Data Entry:** Forms and inputs will be minimized. Where necessary, they will be clear, simple, and easy to use.

#### **Core Screens and Views**
To deliver the V1.0 functionality, the following conceptual screens are required:
*   Onboarding (Login / Sign Up)
*   Home Screen (featuring discovery carousels)
*   Search & Filter Results Screen
*   Restaurant Profile Screen (with menu)
*   Dish Detail View
*   Shopping Cart & Checkout Flow
*   Live Order Tracking Screen
*   Order History Screen
*   User Profile Screen (including Settings, Saved Addresses, and Favorites)

#### **Accessibility**
*   **Target:** WCAG AA. We will aim to meet WCAG 2.1 AA standards to ensure the app is usable by as many people as possible.

#### **Branding**
*   **To Be Defined:** A formal brand identity and style guide have not yet been created. The branding should evoke a sense of authenticity, quality, and modern Egyptian identity. Key considerations will be color palette, typography, and logo design.

#### **Target Device and Platforms**
*   **Target:** Cross-Platform (iOS & Android Mobile Devices).

---
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

---
### **Section 5: Epic & Story Breakdown**

#### **Epic 1: Foundation & User Onboarding**
**Goal:** To establish the foundational structure of the Flutter application and implement the complete user authentication and initial profile setup flow. This epic delivers the first piece of tangible, testable functionality: a user can create an account, log in, and manage their basic profile.

*   **Story 1.1: Project Setup & Boilerplate**
    *   As a developer, I want a new Flutter project created with a clean folder structure, a chosen state management solution, and basic theme/styling setup, so that I have a consistent and scalable foundation to build all future features upon.
    *   **Acceptance Criteria:** 1. A new Flutter project is created and configured. 2. A logical folder structure is established. 3. A state management solution is chosen and integrated. 4. A basic app theme is configured. 5. A placeholder home screen is visible after logging in.
*   **Story 1.2: User Sign-Up**
    *   As a new user, I want to create a new account using my name, email, and a password, so that I can access the application.
    *   **Acceptance Criteria:** 1. A sign-up screen with fields for Name, Email, and Password is presented. 2. Client-side validation is in place. 3. The app calls the `register` API. 4. On success, the user is logged in. 5. On failure, an error is displayed.
*   **Story 1.3: User Login**
    *   As a returning user, I want to log in using my email and password, so that I can access my account.
    *   **Acceptance Criteria:** 1. A login screen is presented. 2. The app calls the `login` API. 3. On success, the user is taken to the home screen. 4. The auth token is stored securely. 5. On failure, an error is displayed.
*   **Story 1.4: Social Login**
    *   As a new or returning user, I want to sign up or log in using a social media account, so that I can access the app quickly.
    *   **Acceptance Criteria:** 1. A "Sign in with Google" button is present. 2. The native Google Sign-In flow is initiated. 3. The token is sent to the backend. 4. The user is logged in.
*   **Story 1.5: Basic Profile & Address Management**
    *   As a logged-in user, I want to view and manage my basic profile information, so that I can ensure my information is up to date.
    *   **Acceptance Criteria:** 1. A User Profile screen is accessible. 2. It displays the user's name and saved addresses. 3. The user can add a new address. 4. The user can edit or delete an existing address. 5. Changes are persisted via API.

#### **Epic 2: Core Discovery & Ordering Journey**
**Goal:** To implement the primary user flow, from discovering a restaurant and browsing its menu to successfully placing a first order. This epic delivers the core value of the application.

*   **Story 2.1: Location-Based Restaurant Listing**
    *   As a user, I want the app to use my location to show me restaurants that deliver to me, so that I can begin discovering places.
    *   **Acceptance Criteria:** 1. The app requests location permission. 2. The address is displayed and can be changed. 3. The home screen lists restaurants based on the address. 4. Cards show key restaurant info. 5. A loading indicator is shown.
*   **Story 2.2: Search & Basic Filtering**
    *   As a user, I want to search for restaurants or dishes and apply basic filters, so that I can find what I'm looking for.
    *   **Acceptance Criteria:** 1. A search bar is on the home screen. 2. Real-time search results for restaurants and dishes are shown. 3. Basic filters can be applied. 4. Tapping results navigates to the correct page.
*   **Story 2.3: View Restaurant Menu**
    *   As a user, I want to view a restaurant's profile and menu, so that I can decide what to order.
    *   **Acceptance Criteria:** 1. The profile screen shows restaurant details and reviews. 2. The menu is organized by categories. 3. Each item shows name, price, and photo. 4. Tapping an item shows details.
*   **Story 2.4: Add & Manage Items in Cart**
    *   As a user, I want to add items to my cart, specify instructions, and manage my cart, so that I can build and finalize my order.
    *   **Acceptance Criteria:** 1. The user can add items to the cart. 2. Quantity can be specified. 3. A text box for special instructions is available. 4. A persistent cart icon updates. 5. The user can manage items on a dedicated Cart screen. 6. The cart shows a full price breakdown.
*   **Story 2.5: Complete Checkout Process**
    *   As a user, I want to complete the checkout process, so that I can place my order.
    *   **Acceptance Criteria:** 1. A checkout flow is initiated from the cart. 2. The user confirms their address. 3. The user selects a payment method. 4. Digital payments are processed via a gateway. 5. A "Place Order" button submits the order. 6. On success, the user is navigated to order tracking.

#### **Epic 3: Post-Order & Engagement Loop**
**Goal:** To build the post-order experience and features that encourage repeat usage. This epic focuses on user retention and satisfaction.

*   **Story 3.1: Live Order Tracking**
    *   As a user, I want to see the live status of my order, so that I know when to expect my food.
    *   **Acceptance Criteria:** 1. An order tracking screen is shown after order placement. 2. It displays a visual indicator of the order status. 3. The status updates in real-time. 4. It shows the order summary and ETA.
*   **Story 3.2: View Order History**
    *   As a user, I want to view my past orders, so that I can remember what I've ordered.
    *   **Acceptance Criteria:** 1. An "Order History" screen is available. 2. It lists past orders with key details. 3. Tapping an order shows its full details.
*   **Story 3.3: One-Tap Reorder**
    *   As a user, I want a button to reorder a past meal, so that I can do it quickly.
    *   **Acceptance Criteria:** 1. A "Reorder" button is on the past order detail view. 2. Tapping it adds all items to the current cart. 3. The user is navigated to the cart.
*   **Story 3.4: Rate Food & Delivery**
    *   As a user, I want to provide separate ratings for food and delivery, so that I can give fair feedback.
    *   **Acceptance Criteria:** 1. The user is prompted to rate after delivery. 2. The screen has two separate rating controls. 3. The user can add a text review. 4. Ratings are submitted and displayed on the restaurant profile.
*   **Story 3.5: Manage Favorite Dishes**
    *   As a user, I want to save my favorite dishes, so that I can find them easily later.
    *   **Acceptance Criteria:** 1. A "Favorite" icon is on dish listings. 2. Tapping it adds/removes the dish from a personal list. 3. A "Favorites" screen is in the user profile. 4. Tapping a favorite navigates to the restaurant menu.

#### **Epic 4: Proactive Discovery & Community Engine**
**Goal:** To implement the "secret sauce" features that make Otlob a unique discovery tool.

*   **Story 4.1: Display Curated Carousels**
    *   As a user, I want to see curated carousels like 'Hidden Gems', so that I can be inspired to try new places.
    *   **Acceptance Criteria:** 1. The home screen displays one or more carousels. 2. Carousels are populated from a specific API. 3. The user can scroll horizontally. 4. Tapping a card navigates to the restaurant.
*   **Story 4.2: Implement "Surprise Me!" Feature**
    *   As a user, I want a "Surprise Me!" button for a quick recommendation, so that I can make a quick decision.
    *   **Acceptance Criteria:** 1. A "Surprise Me!" button is on the home screen. 2. Tapping it fetches a single recommendation. 3. The app displays the recommendation.
*   **Story 4.3: Implement 'Tawseya' Voting System**
    *   As a user, I want to give my single monthly 'Tawseya', so that I can champion my favorite spot.
    *   **Acceptance Criteria:** 1. A 'Give Tawseya' button is on restaurant profiles. 2. The user can cast their vote if available. 3. The UI gives clear feedback. 4. The button is disabled if the vote is used. 5. The total count is displayed.
*   **Story 4.4: Display Community & Platform Badges**
    *   As a user, I want to see which restaurants are recognized, so that I can identify beloved restaurants.
    *   **Acceptance Criteria:** 1. Restaurants with high 'Tawseya' counts get a special badge. 2. The platform can feature restaurants with an "Otlob's Pick" badge. 3. A "Top Tawseya" list may be featured.

#### **Epic 5: Polishing & "Wow" Factors**
**Goal:** To add the final layer of polish that elevates the app from functional to premium.

*   **Story 5.1: Implement Styled Digital Receipts**
    *   As a user, I want to see a beautifully styled digital receipt, so that I feel confident in the service.
    *   **Acceptance Criteria:** 1. A visually appealing receipt is shown on order confirmation and in history. 2. It includes all necessary order details. 3. The design is clean and professional.
*   **Story 5.2: Implement Downloadable Receipts**
    *   As a user, I want to download a receipt, so that I can save it for my records.
    *   **Acceptance Criteria:** 1. A "Download Receipt" button is in the order history. 2. Tapping it generates a PDF/Image file. 3. The app prompts the user to save the file. 4. The downloaded receipt is professionally styled.
*   **Story 5.3: Share a Menu Item**
    *   As a user, I want to share a link to a dish, so that I can recommend it to a friend.
    *   **Acceptance Criteria:** 1. A "Share" icon is on the dish detail view. 2. It opens the native sharing dialog. 3. The shared content includes a deep link to the item in the app.
*   **Story 5.4: Implement Advanced Filtering**
    *   As a user, I want to apply advanced filters, so that I can narrow down my choices.
    *   **Acceptance Criteria:** 1. The filter screen includes options for rating and promotions. 2. Applying filters updates the restaurant list.

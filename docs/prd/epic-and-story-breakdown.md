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

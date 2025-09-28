### **Section 4: Component Standards (Revised)**

#### **Component Template**
```dart
import 'package:flutter/material.dart';

/// A card that displays a summary of a restaurant.
class RestaurantCard extends StatelessWidget {
  /// The name of the restaurant.
  final String name;

  /// The URL for the restaurant's primary image.
  final String imageUrl;

  /// {@macro restaurant_card}
  const RestaurantCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Image.network(imageUrl),
        Text(name, style: textTheme.titleMedium),
      ],
    );
  }
}
```

#### **Naming Conventions**
| Element Type | Convention | Example |
| :--- | :--- | :--- |
| Files (Public) | `snake_case.dart` | `restaurant_card.dart` |
| Files (Private) | `_snake_case.dart` | `_private_helper.dart` |
| Classes / Widgets | `PascalCase` | `RestaurantCard` |
| Test Files | `..._test.dart` | `restaurant_card_test.dart` |
| Screens / Pages | `..._screen.dart` | `home_screen.dart` |
| BLoCs / Cubits | `..._bloc.dart` | `home_bloc.dart` |
| Repositories (Abstract) | `..._repository.dart` | `auth_repository.dart` |
| Repositories (Impl) | `..._repository_impl.dart` | `auth_repository_impl.dart` |
| Data Sources | `..._datasource.dart` | `auth_remote_datasource.dart` |

#### **State Management**
*   **Default:** Use **Cubit** for simple state management.
*   **Advanced:** Use **BLoC** for complex scenarios with events.

#### **Styling & Theming**
*   **Centralized Theme:** All styles will be defined in `lib/app/theme.dart`.
*   **No Hardcoded Values:** Widgets must reference the theme via `Theme.of(context)`.

#### **Linting & Enforcement**
*   **Enforcement:** Standards will be enforced automatically using `flutter_lints` and potentially `very_good_analysis`.

#### **Documentation**
*   **Public APIs:** All public classes and methods must be documented using DartDoc (`///`).
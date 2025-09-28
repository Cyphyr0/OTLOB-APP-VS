### **Section 10: Environment Configuration (Revised)**

#### **Approach**
Use a multi-environment `.env` file strategy, managed by Flutter flavors (`.env.dev`, `.env.prod`).

#### **CI/CD & Secrets Management**
`.env` files will not be stored in CI. Secrets will be injected at build time from the CI system's secret store.

#### **Configuration Access & Validation (`core/config/config.dart`)**
```dart
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static Future<void> load(String flavor) async {
    await dotenv.load(fileName: '.env.$flavor');
    _validate();
  }

  static void _validate() {
    final requiredKeys = ['API_BASE_URL'];
    for (final key in requiredKeys) {
      if (!dotenv.isInitialized || dotenv.env[key] == null) {
        throw Exception('FATAL: Missing required environment variable: $key');
      }
    }
  }

  static String get apiBaseUrl => dotenv.env['API_BASE_URL']!;
  static bool get useMockPayments => dotenv.env['USE_MOCK_PAYMENTS']?.toLowerCase() == 'true';
}
```
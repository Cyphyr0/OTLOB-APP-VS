### **Section 7: Routing (Revised)**

#### **Route Configuration (`app/router.dart`)**
```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouter {
  final AuthBloc authBloc;
  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) {
          return Placeholder(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => const NoTransitionPage(child: Placeholder()),
          ),
          GoRoute(
            path: '/orders',
            pageBuilder: (context, state) => const NoTransitionPage(child: Placeholder()),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => const NoTransitionPage(child: Placeholder()),
      ),
      GoRoute(
        path: '/restaurant/:id',
        builder: (BuildContext context, GoRouterState state) {
          final restaurantId = state.pathParameters['id']!;
          return const Placeholder();
        },
      ),
    ],

    errorBuilder: (context, state) => const Text("404 - Not Found"),

    redirect: (BuildContext context, GoRouterState state) {
      final authState = authBloc.state;
      final bool loggedIn = authState is Authenticated;
      final bool isLoggingIn = state.matchedLocation == '/login';

      if (!loggedIn && !isLoggingIn) return '/login';
      if (loggedIn && isLoggingIn) return '/';
      
      return null;
    },
  );
}
```

#### **Testing Routes**
Every new route must be accompanied by a navigation test.
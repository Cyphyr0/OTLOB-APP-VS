import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otlob/features/auth/screens/login_screen.dart';
import 'package:otlob/features/auth/screens/signup_screen.dart';
import 'package:otlob/features/home/home_screen.dart';
import 'package:otlob/features/profile/screens/profile_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/signup',
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        },
      ),
    ],
    errorBuilder: (context, state) => const Text("404 - Not Found"),
  );
}
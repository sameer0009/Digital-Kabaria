import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_core/shared_core.dart';
import '../features/dashboard/presentation/admin_dashboard_screen.dart';
import '../features/dashboard/presentation/admin_overview_screen.dart';
import '../features/dashboard/presentation/admin_users_screen.dart';

final adminRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/dashboard/overview',
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const Scaffold(body: Center(child: Text('Admin Login (Stub)'))),
      ),
      ShellRoute(
        builder: (context, state, child) => AdminDashboardScreen(child: child),
        routes: [
          GoRoute(
            path: '/dashboard/overview',
            builder: (context, state) => const AdminOverviewScreen(),
          ),
          GoRoute(
            path: '/dashboard/users',
            builder: (context, state) => const AdminUsersScreen(),
          ),
          GoRoute(
            path: '/dashboard/categories',
            builder: (context, state) => const Center(child: Text('Categories Management Placeholder')),
          ),
          GoRoute(
            path: '/dashboard/listings',
            builder: (context, state) => const Center(child: Text('Listings & Quotes Tracker Placeholder')),
          ),
          GoRoute(
            path: '/dashboard/transactions',
            builder: (context, state) => const Center(child: Text('Transactions Ledger Placeholder')),
          ),
        ],
      ),
    ],
  );
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_core/shared_core.dart';
import 'package:data_layer/data_layer.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/seller/presentation/seller_home_screen.dart';
import '../features/seller/presentation/seller_create_listing_screen.dart';
import '../features/seller/presentation/seller_listing_detail_screen.dart';
import '../features/seller/presentation/seller_pickup_tracking_screen.dart';
import '../features/dealer/presentation/dealer_home_screen.dart';
import '../features/dealer/presentation/dealer_listing_detail_screen.dart';
import '../features/dealer/presentation/dealer_jobs_screen.dart';
import '../features/profile/presentation/user_portfolio_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      final isLoading = authState.isLoading;
      if (isLoading) return null;

      final isAuth = authState.value != null;
      final isLoggingIn = state.uri.toString() == AppRoutes.login || state.uri.toString() == AppRoutes.register;
      final isSplash = state.uri.toString() == AppRoutes.splash;

      if (isSplash && !isLoading) {
        return isAuth ? AppRoutes.sellerHome : AppRoutes.login;
      }

      if (!isAuth && !isLoggingIn) {
        return AppRoutes.login;
      }

      if (isAuth && isLoggingIn) {
        return AppRoutes.sellerHome;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.portfolio,
        builder: (context, state) => UserPortfolioScreen(userId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: AppRoutes.sellerHome,
        builder: (context, state) => const SellerHomeScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.sellerCreateListing,
            builder: (context, state) => const SellerCreateListingScreen(),
          ),
          GoRoute(
            path: AppRoutes.sellerListingDetail,
            builder: (context, state) => SellerListingDetailScreen(listingId: state.pathParameters['id']!),
          ),
          GoRoute(
            path: AppRoutes.sellerPickupTracking,
            builder: (context, state) => SellerPickupTrackingScreen(pickupId: state.pathParameters['id']!),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.dealerHome,
        builder: (context, state) => const DealerHomeScreen(),
        routes: [
           GoRoute(
            path: AppRoutes.dealerListingDetail,
            builder: (context, state) => DealerListingDetailScreen(listingId: state.pathParameters['id']!),
          ),
          GoRoute(
            path: AppRoutes.dealerJobs,
            builder: (context, state) => const DealerJobsScreen(),
          ),
        ],
      ),
    ],
  );
});

class AppRoutes {
  // Common
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String onboarding = '/onboarding';
  
  // Seller Mobile
  static const String sellerHome = '/seller';
  static const String sellerCreateListing = 'create'; // nested under /seller
  static const String sellerListingDetail = 'listing/:id';
  static const String sellerPickupTracking = 'pickup/:id';
  
  // Dealer Mobile
  static const String dealerHome = '/dealer';
  static const String dealerListingDetail = 'listing/:id';
  static const String dealerJobs = 'jobs';

  // Admin Web
  static const String adminDashboard = '/dashboard';
  static const String adminUsers = '/users';
}

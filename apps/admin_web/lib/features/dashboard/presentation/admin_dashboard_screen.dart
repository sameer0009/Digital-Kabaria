import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class AdminDashboardScreen extends ConsumerStatefulWidget {
  final Widget child;
  const AdminDashboardScreen({super.key, required this.child});

  @override
  ConsumerState<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends ConsumerState<AdminDashboardScreen> {
  int _selectedIndex = 0;

  final _destinations = const [
    NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Overview')),
    NavigationRailDestination(icon: Icon(Icons.people), label: Text('Users & KYC')),
    NavigationRailDestination(icon: Icon(Icons.category), label: Text('Categories')),
    NavigationRailDestination(icon: Icon(Icons.list_alt), label: Text('Listings & Quotes')),
    NavigationRailDestination(icon: Icon(Icons.receipt), label: Text('Transactions')),
  ];

  void _onDestinationSelected(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0: context.go('/dashboard/overview'); break;
      case 1: context.go('/dashboard/users'); break;
      case 2: context.go('/dashboard/categories'); break;
      case 3: context.go('/dashboard/listings'); break;
      case 4: context.go('/dashboard/transactions'); break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DK Admin Console'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        leading: (!isDesktop && !isMobile) ? null : (isDesktop ? null : Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        )),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: () => context.go('/login')),
        ],
      ),
      drawer: isDesktop ? null : Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.admin_panel_settings, color: Colors.white, size: 48),
                  const SizedBox(height: 8),
                  Text('Admin Console', style: AppTypography.titleLarge.copyWith(color: Colors.white)),
                ],
              ),
            ),
            ...List.generate(_destinations.length, (index) {
              final dest = _destinations[index];
              return ListTile(
                leading: dest.icon,
                title: dest.label,
                selected: _selectedIndex == index,
                onTap: () {
                  Navigator.pop(context);
                  _onDestinationSelected(index);
                },
              );
            }),
          ],
        ),
      ),
      body: Row(
        children: [
          if (isDesktop || (!isMobile && !isDesktop))
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onDestinationSelected,
              labelType: isDesktop ? null : NavigationRailLabelType.all,
              backgroundColor: AppColors.surface,
              selectedIconTheme: const IconThemeData(color: AppColors.primary),
              selectedLabelTextStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              extended: isDesktop,
              destinations: _destinations,
            ),
          if (isDesktop || (!isMobile && !isDesktop))
            const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}

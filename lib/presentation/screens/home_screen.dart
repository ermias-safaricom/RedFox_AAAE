/// Home Screen
/// 
/// Main dashboard screen for the leave management system.
/// Features an app bar with notifications and logout icons,
/// a top banner, and a scrollable grid of menu cards.
/// 
/// Customize menu items by editing the _menuItems list.

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/top_banner.dart';
import '../widgets/grid_menu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('HOME'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notifications
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top Banner
              const TopBanner(
                icon: Icons.info_outline,
                title: 'Quick Access',
                subtitle: 'Manage your leave requests efficiently',
              ),
              const SizedBox(height: 20),

              // Grid Menu
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Calculate number of columns based on screen width
                    int crossAxisCount = 3;
                    if (constraints.maxWidth < 600) {
                      crossAxisCount = 2;
                    } else if (constraints.maxWidth > 900) {
                      crossAxisCount = 4;
                    }

                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: _buildMenuItems(context),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuItems(BuildContext context) {
    final menuItems = [
      {
        'icon': Icons.calendar_today,
        'label': 'Leave Request',
        'route': '/leave-request',
      },
      {
        'icon': Icons.history,
        'label': 'Leave History',
        'route': null,
      },
      {
        'icon': Icons.analytics_outlined,
        'label': 'Reports',
        'route': null,
      },
      {
        'icon': Icons.people_outline,
        'label': 'Team',
        'route': null,
      },
      {
        'icon': Icons.settings_outlined,
        'label': 'Settings',
        'route': null,
      },
      {
        'icon': Icons.help_outline,
        'label': 'Help',
        'route': null,
      },
    ];

    return menuItems.map((item) {
      return GridMenuCard(
        icon: item['icon'] as IconData,
        label: item['label'] as String,
        onTap: () {
          final route = item['route'] as String?;
          if (route != null) {
            Navigator.of(context).pushNamed(route);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${item['label']} - Coming Soon'),
              ),
            );
          }
        },
      );
    }).toList();
  }
}

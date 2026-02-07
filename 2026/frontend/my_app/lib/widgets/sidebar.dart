import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: const Color(0xFF4A6A8A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),

          // Logo / Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'LIFEDASH',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Menu items
          SidebarItem(icon: Icons.dashboard, label: 'Dashboard'),
          SidebarItem(icon: Icons.bar_chart, label: 'Analytics'),
          SidebarItem(icon: Icons.settings, label: 'Settings'),
        ],
      ),
    );
  }
}


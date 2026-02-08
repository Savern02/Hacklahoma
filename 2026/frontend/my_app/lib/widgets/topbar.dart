import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String currentPage;
  final Function(String) onNavigate;
  final VoidCallback? onLogout;
  final String? userName;

  const TopBar({
    Key? key,
    required this.currentPage,
    required this.onNavigate,
    this.onLogout,
    this.userName,
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16.0 : 24.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo/App Title
            GestureDetector(
              onTap: () => onNavigate('home'),
              child: Row(
                children: [
                  Icon(
                    Icons.health_and_safety,
                    color: Colors.white,
                    size: isMobile ? 28 : 32,
                  ),
                  SizedBox(width: isMobile ? 8 : 12),
                  if (!isMobile)
                    Text(
                      'HealthTrack',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                ],
              ),
            ),

            // Navigation Menu
            if (!isMobile)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _NavItem(
                      label: 'Dashboard',
                      isActive: currentPage == 'dashboard',
                      onTap: () => onNavigate('dashboard'),
                    ),
                    SizedBox(width: 24),
                    _NavItem(
                      label: 'Nutrition',
                      isActive: currentPage == 'nutrition',
                      onTap: () => onNavigate('nutrition'),
                    ),
                    SizedBox(width: 24),
                    _NavItem(
                      label: 'Progress',
                      isActive: currentPage == 'progress',
                      onTap: () => onNavigate('progress'),
                    ),
                    SizedBox(width: 24),
                    _NavItem(
                      label: 'Journal',
                      isActive: currentPage == 'journal',
                      onTap: () => onNavigate('journal'),
                    ),
                  ],
                ),
              ),

            // User Menu / Actions
            Row(
              children: [
                if (userName != null && !isMobile)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'Welcome, ${userName!}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                if (isMobile)
                  PopupMenuButton<String>(
                    onSelected: (value) => onNavigate(value),
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'dashboard',
                        child: Text('Dashboard'),
                      ),
                      const PopupMenuItem(
                        value: 'nutrition',
                        child: Text('Nutrition'),
                      ),
                      const PopupMenuItem(
                        value: 'progress',
                        child: Text('Progress'),
                      ),
                      const PopupMenuItem(
                        value: 'journal',
                        child: Text('Journal'),
                      ),
                    ],
                    icon: const Icon(Icons.menu, color: Colors.white),
                  )
                else
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'logout') {
                        onLogout?.call();
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'settings',
                        child: Text('Settings'),
                      ),
                      const PopupMenuItem(
                        value: 'profile',
                        child: Text('Profile'),
                      ),
                      const PopupMenuDivider(),
                      const PopupMenuItem(
                        value: 'logout',
                        child: Text('Logout'),
                      ),
                    ],
                    icon: const Icon(Icons.account_circle, color: Colors.white),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (widget.isActive || _isHovered)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 3,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

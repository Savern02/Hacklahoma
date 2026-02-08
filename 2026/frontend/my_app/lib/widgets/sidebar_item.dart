import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () {},
      ),
    );
  }
}


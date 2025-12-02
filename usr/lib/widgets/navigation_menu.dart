import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationMenu({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: Colors.black.withOpacity(0.2),
      child: Column(
        children: [
          _buildNavItem(context, 0, Icons.home_filled, "Home"),
          const SizedBox(height: 20),
          _buildNavItem(context, 1, Icons.grid_view_rounded, "My Games"),
          const SizedBox(height: 20),
          _buildNavItem(context, 2, Icons.shopping_bag_outlined, "Store"),
          const Spacer(),
          _buildNavItem(context, 3, Icons.search, "Search"),
          const SizedBox(height: 20),
          _buildNavItem(context, 4, Icons.settings_outlined, "Settings"),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon, String label) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => onDestinationSelected(index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(25), // Circle or rounded square
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.black : Colors.white70,
          size: 26,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/navigation_menu.dart';
import 'package:couldai_user_app/widgets/dashboard_grid.dart';
import 'package:couldai_user_app/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Xbox UI is typically landscape, so we assume landscape or handle responsive
    return Scaffold(
      body: Stack(
        children: [
          // Background Image/Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1A1A1A),
                  Color(0xFF0D0D0D),
                ],
              ),
            ),
          ),
          
          // Main Content Layout
          Row(
            children: [
              // Side Navigation (Hidden on small screens? No, usually always visible or minimized)
              NavigationMenu(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
              
              // Main Dashboard Area
              Expanded(
                child: Column(
                  children: [
                    const TopBar(),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: DashboardGrid(selectedIndex: _selectedIndex),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

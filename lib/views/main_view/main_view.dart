import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Center(child: Text('Home')),
    Center(child: Text('Recent')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: AppColors.secondaryColor),
          NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) => setState(() {
              _currentIndex = index;
            }),
            height: 75,
            backgroundColor: Colors.white,
            indicatorColor: Colors.transparent,
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                  size: 36,
                ),
                selectedIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home, color: AppColors.primaryColor, size: 36),
                    CircleAvatar(
                      radius: 2.5,
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ],
                ),
                label: 'home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.alarm,
                  color: AppColors.secondaryColor,
                  size: 36,
                ),
                selectedIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.alarm, color: AppColors.primaryColor, size: 36),
                    CircleAvatar(
                      radius: 2.5,
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ],
                ),
                label: 'alarm',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person,
                  color: AppColors.secondaryColor,
                  size: 36,
                ),
                selectedIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person, color: AppColors.primaryColor, size: 36),
                    CircleAvatar(
                      radius: 2.5,
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ],
                ),
                label: 'person',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

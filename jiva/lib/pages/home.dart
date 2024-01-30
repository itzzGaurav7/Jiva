import 'package:flutter/material.dart';
import 'package:jiva/pages/profile_page.dart';
import 'package:jiva/pages/fit_page.dart';
import 'package:jiva/pages/homebody.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:jiva/pages/detection_page.dart';
import 'package:jiva/pages/analy_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  int _bodyIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_bodyIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: const Color(0xff757575),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _bodyIndex = index;
          });
        },
        items: _navBarItems,
      ),
    );
  }
}

final _body = [
  HomeBody(),
  FitBody(),
  DetectionBody(),
  AnalyBody(),
  ProfilePage()
];

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home_max_sharp),
    title: const Text("Home"),
    selectedColor: Colors.blue[700],
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.favorite_border),
    title: const Text("Health"),
    selectedColor: Colors.pink,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.camera_alt_outlined),
    title: const Text("Detector"),
    selectedColor: Colors.purple,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.analytics_outlined),
    title: const Text("Analytics"),
    selectedColor: Colors.orange,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person_4_rounded),
    title: const Text("Profile"),
    selectedColor: Colors.teal,
  ),
];

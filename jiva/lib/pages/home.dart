import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Column(
        children: [
          Container(
            // Set the background color to blue
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Gaurav!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "17 Jan 2024",
                              style: TextStyle(color: Colors.white60),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.blue, // Set the icon color to blue
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.blue[700],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      height: 60,
                    ),
                    Container(
                      height: 100,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "How are you feeling today?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            ),
          )
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: const Color(0xff757575),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _navBarItems,
      ),
    );
  }
}

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

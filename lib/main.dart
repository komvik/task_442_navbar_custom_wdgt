import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Widget> widgets = [
    const NewsWidget(),
    const LikesWidget(),
    const ProfileWidget(),
  ];

  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lime,
          title: const Text("MyApp"),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (int index) {
            currentIndex = index;
            setState(() {});
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.newspaper), label: "News"),
            NavigationDestination(icon: Icon(Icons.favorite), label: "Likes"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
        body: widgets[currentIndex],
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "News",
            style: TextStyle(fontSize: 26),
          ),
          Icon(
            Icons.newspaper,
            size: 42,
          ),
        ],
      ),
    );
  }
}

class LikesWidget extends StatelessWidget {
  const LikesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Likes",
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  "Hier findest du deine gelikten Nachrichten",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text("Profile", style: TextStyle(fontSize: 26)),
          Icon(
            Icons.person,
            size: 42,
          ),
          Text("Max Musterman", style: TextStyle(fontSize: 28)),
        ],
      ),
    );
  }
}

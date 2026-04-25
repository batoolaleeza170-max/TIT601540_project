// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SmartWheelchairApp());
}

class SmartWheelchairApp extends StatelessWidget {
  const SmartWheelchairApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Smart Wheelchair',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> features = const [
    {
      "title": "Obstacle Detection",
      "icon": Icons.warning_amber_rounded,
      "color": Colors.red
    },
    {
      "title": "Voice Control",
      "icon": Icons.mic,
      "color": Colors.green
    },
    {
      "title": "GPS Navigation",
      "icon": Icons.location_on,
      "color": Colors.blue
    },
    {
      "title": "Battery Status",
      "icon": Icons.battery_full,
      "color": Colors.orange
    },
    {
      "title": "Emergency Alert",
      "icon": Icons.emergency,
      "color": Colors.purple
    },
    {
      "title": "Auto Drive",
      "icon": Icons.directions,
      "color": Colors.teal
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Smart Wheelchair"),
        centerTitle: true,
      ),

      body: CustomScrollView(
        slivers: [

          // Sliver App Bar
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Semi Autonomous"),
              background: Image.network(
                "https://images.unsplash.com/photo-1517841905240-472988babdf9",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // User Info Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                elevation: 6,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 28,
                    child: Icon(Icons.person),
                  ),
                  title: const Text(
                    "User Status: Safe",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Wheelchair connected successfully"),
                  trailing: const Icon(Icons.check_circle, color: Colors.green),
                ),
              ),
            ),
          ),

          // Grid Features
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = features[index];
                  return Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${item["title"]} Activated"),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item["icon"],
                            size: 45,
                            color: item["color"],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item["title"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: features.length,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),

          // Activity List
          SliverList(
            delegate: SliverChildListDelegate([
              const ListTile(
                leading: Icon(Icons.sensors),
                title: Text("Sensor Check"),
                subtitle: Text("All sensors working properly"),
              ),
              const ListTile(
                leading: Icon(Icons.speed),
                title: Text("Current Speed"),
                subtitle: Text("5 km/h"),
              ),
              const ListTile(
                leading: Icon(Icons.map),
                title: Text("Destination"),
                subtitle: Text("Home Route Active"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
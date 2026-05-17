import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget infoCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 35,
        ),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Smart Wheelchair"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            infoCard(
              "Battery",
              "85%",
              Icons.battery_full,
            ),

            infoCard(
              "Obstacle Detection",
              "Active",
              Icons.warning,
            ),

            infoCard(
              "Voice Command",
              "Listening...",
              Icons.mic,
            ),

            infoCard(
              "Firebase Status",
              "Connected",
              Icons.cloud_done,
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.navigation),
              label: const Text("Start Navigation"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


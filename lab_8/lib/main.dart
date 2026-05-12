import 'package:flutter/material.dart';

void main() {
  runApp(SmartWheelchairApp());
}

class SmartWheelchairApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Wheelchair',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// ================= HOME PAGE =================

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(),
    NavigationPage(),
    EmergencyPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "AI Smart Wheelchair",
          style: TextStyle(color: Colors.white),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.white),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
        ],
      ),

      // BODY
      body: _pages[_currentIndex],

      // FLOATING BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,

        child: Icon(
          Icons.assistant,
          color: Colors.white,
        ),

        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("AI Assistant Activated"),
            ),
          );
        },
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      // BOTTOM APP BAR
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,

        color: Colors.blue.shade700,

        child: SizedBox(
          height: 70,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [

              // HOME
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: _currentIndex == 0
                      ? Colors.yellow
                      : Colors.white,
                  size: 30,
                ),

                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),

              // NAVIGATION
              IconButton(
                icon: Icon(
                  Icons.navigation,
                  color: _currentIndex == 1
                      ? Colors.yellow
                      : Colors.white,
                  size: 30,
                ),

                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),

              SizedBox(width: 40),

              // EMERGENCY
              IconButton(
                icon: Icon(
                  Icons.warning,
                  color: _currentIndex == 2
                      ? Colors.yellow
                      : Colors.white,
                  size: 30,
                ),

                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
              ),

              // SETTINGS
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: _currentIndex == 3
                      ? Colors.yellow
                      : Colors.white,
                  size: 30,
                ),

                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= DASHBOARD PAGE =================

class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Center(
                child: Hero(
                  tag: "wheelchair",

                  child: Icon(
                    Icons.accessible,
                    size: 140,
                    color: Colors.blue,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Center(
                child: Text(
                  "Wheelchair Dashboard",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),

              SizedBox(height: 30),

              // STATUS CARDS

              statusCard(
                icon: Icons.battery_full,
                title: "Battery Status",
                subtitle: "85% Remaining",
                color: Colors.green,
              ),

              SizedBox(height: 15),

              statusCard(
                icon: Icons.smart_toy,
                title: "AI Assistance",
                subtitle: "Activated",
                color: Colors.orange,
              ),

              SizedBox(height: 15),

              statusCard(
                icon: Icons.security,
                title: "Obstacle Detection",
                subtitle: "System Active",
                color: Colors.red,
              ),

              SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),

                  child: Text(
                    "View Details",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statusCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {

    return Container(
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: color,
            radius: 28,

            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),

          SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ================= DETAIL PAGE =================

class DetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: Text(
          "Wheelchair Details",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Center(
        child: Hero(
          tag: "wheelchair",

          child: Icon(
            Icons.accessible,
            size: 220,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

// ================= NAVIGATION PAGE =================

class NavigationPage extends StatefulWidget {

  @override
  _NavigationPageState createState() =>
      _NavigationPageState();
}

class _NavigationPageState
    extends State<NavigationPage> {

  int _selectedMode = 0;

  String _mode = "Indoor Navigation";

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            "Select Navigation Mode",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),

          SizedBox(height: 20),

          Card(
            child: RadioListTile(
              title: Text("Indoor Navigation"),
              value: 0,
              groupValue: _selectedMode,

              onChanged: (value) {
                setState(() {
                  _selectedMode = value!;
                  _mode = "Indoor Navigation";
                });
              },
            ),
          ),

          Card(
            child: RadioListTile(
              title: Text("Outdoor Navigation"),
              value: 1,
              groupValue: _selectedMode,

              onChanged: (value) {
                setState(() {
                  _selectedMode = value!;
                  _mode = "Outdoor Navigation";
                });
              },
            ),
          ),

          Card(
            child: RadioListTile(
              title: Text("Voice Assistance"),
              value: 2,
              groupValue: _selectedMode,

              onChanged: (value) {
                setState(() {
                  _selectedMode = value!;
                  _mode = "Voice Assistance";
                });
              },
            ),
          ),

          SizedBox(height: 30),

          Container(
            padding: EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Text(
              "Selected Mode: $_mode",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= EMERGENCY PAGE =================

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: ElevatedButton.icon(

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 18,
          ),
        ),

        icon: Icon(
          Icons.warning,
          color: Colors.white,
        ),

        label: Text(
          "SEND SOS ALERT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),

        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Emergency Alert Sent"),
            ),
          );
        },
      ),
    );
  }
}

// ================= SETTINGS PAGE =================

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text(
        "Settings Page",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

// ================= ABOUT PAGE =================

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: Text(
          "About",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Text(
          "This AI Based Semi-Autonomous Smart Wheelchair application helps disabled and elderly users with smart mobility, obstacle detection, navigation assistance, and emergency alerts.",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
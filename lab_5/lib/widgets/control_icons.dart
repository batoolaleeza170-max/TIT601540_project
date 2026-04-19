import 'package:flutter/material.dart';
class ControlIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "CONTROL COMMANDS",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.arrow_upward, size: 40, color: Colors.blue),
            Icon(Icons.arrow_back, size: 40, color: Colors.orange),
            Icon(Icons.arrow_forward, size: 40, color: Colors.green),
            Icon(Icons.stop, size: 40, color: Colors.red),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
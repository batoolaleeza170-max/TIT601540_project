import 'package:flutter/material.dart';
class StatusImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Text(
          "NOVA WHEELCHAIR STATUS",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Image.asset(
          "assets/images/wheelchair.png",
          height: 160,
        ),
        SizedBox(height: 10),
        Text(
          "Status: READY / IDLE",
          style: TextStyle(color: Colors.green),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
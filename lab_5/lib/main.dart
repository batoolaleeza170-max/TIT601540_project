import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
void main() {
  runApp(const SmartWheelchairApp());
}
class SmartWheelchairApp extends StatelessWidget {
  const SmartWheelchairApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOVA Smart Wheelchair',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

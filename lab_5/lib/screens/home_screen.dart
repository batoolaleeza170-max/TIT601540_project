import 'package:flutter/material.dart';
import '../widgets/status_image.dart';
import '../widgets/control_icons.dart';
import '../widgets/command_form.dart';
import '../widgets/animations.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOVA Smart Wheelchair"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StatusImage(),
            AnimatedMovement(),
            ControlIcons(),
            AnimatedControls(),
            CommandForm(),
          ],
        ),
      ),
    );
  }
}

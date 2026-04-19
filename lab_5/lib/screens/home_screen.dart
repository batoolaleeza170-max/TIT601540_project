import 'package:flutter/material.dart';
import '../widgets/status_image.dart';
import '../widgets/control_icons.dart';
import '../widgets/command_form.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOVA Wheelchair Control Lab"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StatusImage(),
            ControlIcons(),
            CommandForm(),
          ],
        ),
      ),
    );
  }
}
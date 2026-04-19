import 'package:flutter/material.dart';
class AnimatedMovement extends StatefulWidget {
  @override
  _AnimatedMovementState createState() => _AnimatedMovementState();
}
class _AnimatedMovementState extends State<AnimatedMovement> {
  bool moved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Movement Animation"),
        GestureDetector(
          onTap: () {
            setState(() {
              moved = !moved;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(left: moved ? 120 : 0),
            child: Image.asset("assets/images/wheelchair.png", height: 100),
          ),
        ),
      ],
    );
  }
}
class AnimatedControls extends StatefulWidget {
  @override
  _AnimatedControlsState createState() => _AnimatedControlsState();
}
class _AnimatedControlsState extends State<AnimatedControls> {
  bool running = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              running = !running;
            });
          },
          child: Text("Start/Stop"),
        ),
        AnimatedCrossFade(
          duration: Duration(seconds: 1),
          firstChild: Icon(Icons.stop, size: 50, color: Colors.red),
          secondChild: Icon(Icons.play_arrow, size: 50, color: Colors.green),
          crossFadeState:
          running ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
class CommandForm extends StatefulWidget {
  @override
  _CommandFormState createState() => _CommandFormState();
}
class _CommandFormState extends State<CommandForm> {
  final _formKey = GlobalKey<FormState>();
  String command = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "MANUAL COMMAND INPUT",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Command (forward/left/right/stop)",
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.keyboard),
                  ),
                  onSaved: (value) {
                    command = value!;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Command Sent: $command"),
                      ),
                    );
                  },
                  child: Text("Send to NOVA"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
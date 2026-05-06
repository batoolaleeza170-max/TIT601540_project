import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/user_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> users = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }
  void fetchUsers() async {
    try {
      final data = await ApiService().getUsers();
      setState(() {
        users = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOVA Dashboard"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
            ),
          );
        },
      ),
    );
  }
}

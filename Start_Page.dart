import 'package:flutter/material.dart';
import 'home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final genderController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "🌹 Rose Live Registration",
                style: TextStyle(color: Colors.pinkAccent, fontSize: 22),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: countryController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Country",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: genderController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Gender",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: passController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 10),

              TextField(
                controller: confirmPassController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  final userId = DateTime.now().millisecondsSinceEpoch.toString();
                  final userName = nameController.text.trim();

                  // 🔹 Auto generate room info
                  final roomName = "$userName's Room";
                  final roomPhoto = "assets/images/default_room.jpg";
                  final roomAnnounce = "Welcome to $roomName 💖";

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(
                        userID: userId,
                        userName: userName,
                        roomName: roomName,
                        roomPhoto: roomPhoto,
                        roomAnnounce: roomAnnounce,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                ),
                child: const Text(
                  "Start Now",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
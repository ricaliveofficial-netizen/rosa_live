import 'package:flutter/material.dart';
import 'room_page.dart';

class HomePage extends StatefulWidget {
  final String userID;
  final String userName;
  final String roomName;
  final String roomPhoto;
  final String roomAnnounce;

  const HomePage({
    super.key,
    required this.userID,
    required this.userName,
    required this.roomName,
    required this.roomPhoto,
    required this.roomAnnounce,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasRoom = false;

  void handleGoLive() {
    if (!hasRoom) {
      setState(() => hasRoom = true);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RoomPage(
          roomID: widget.userID,
          userID: widget.userID,
          userName: widget.userName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              "🌹 Welcome ${widget.userName}",
              style: const TextStyle(color: Colors.pinkAccent, fontSize: 22),
            ),
            const SizedBox(height: 20),

            // Room preview
            Card(
              color: Colors.white10,
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(widget.roomPhoto, height: 150, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(widget.roomName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                        const SizedBox(height: 5),
                        Text(widget.roomAnnounce,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: handleGoLive,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 14),
              ),
              child: Text(
                hasRoom ? "Enter My Room" : "Go Live",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

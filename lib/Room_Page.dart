// room_page.dart
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'zego_service.dart';

class RoomPage extends StatelessWidget {
  final String roomID;
  final bool isHost;

  const RoomPage({
    Key? key,
    required this.roomID,
    this.isHost = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // user id / name simple generator
    final userID = "user_${DateTime.now().millisecondsSinceEpoch}";
    final userName = "User_${DateTime.now().second}";

    final config = isHost ? ZegoService.hostConfig() : ZegoService.audienceConfig();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(isHost ? "Audio Room (Host)" : "Audio Room"),
          backgroundColor: Colors.pinkAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        body: ZegoUIKitPrebuiltLiveStreaming(
          appID: ZegoService.appID,
          appSign: ZegoService.appSign,
          userID: userID,
          userName: userName,
          liveID: roomID,
          config: config,
          // Optional: customize bottom control bar or other UI
          // If you want only mic controls visible you can pass config params or
          // use custom UI wrapper — prebuilt gives default controls.
        ),
      ),
    );
  }
}

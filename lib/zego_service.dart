// zego_service.dart
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class ZegoService {
  // তোমার AppID & AppSign (তুমি আগে দিয়েছিলে)
  static const int appID = 797005425;
  static const String appSign =
      "4881371f38bfb34655ffa2ffa4514626eacc12b5a09189dcfe4c8211846cc81a";

  // Host config (audio-focused)
  static ZegoUIKitPrebuiltLiveStreamingConfig hostConfig() {
    final cfg = ZegoUIKitPrebuiltLiveStreamingConfig.host();
    // Turn camera off when joining
    try {
      cfg.turnOnCameraWhenJoining = false;
    } catch (_) {}
    // Ensure microphone is on
    try {
      cfg.turnOnMicrophoneWhenJoining = true;
    } catch (_) {}
    // Hide video view UI if available
    try {
      cfg.showLiveVideoView = false;
    } catch (_) {}
    return cfg;
  }

  // Audience config (audio-focused)
  static ZegoUIKitPrebuiltLiveStreamingConfig audienceConfig() {
    final cfg = ZegoUIKitPrebuiltLiveStreamingConfig.audience();
    try {
      cfg.turnOnCameraWhenJoining = false;
    } catch (_) {}
    try {
      cfg.turnOnMicrophoneWhenJoining = false; // audience mic off by default
    } catch (_) {}
    try {
      cfg.showLiveVideoView = false;
    } catch (_) {}
    return cfg;
  }
}

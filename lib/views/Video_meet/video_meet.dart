import 'package:flutter/material.dart';

class VideoMeetingPage extends StatefulWidget {
  final String doctorName;
  final String appointmentDay;
  final String appointmentStartTime;
  final String appointmentEndTime;
  final int randomNumber;

  const VideoMeetingPage({
    Key? key,
    required this.doctorName,
    required this.appointmentDay,
    required this.appointmentStartTime,
    required this.appointmentEndTime,
    required this.randomNumber,
  }) : super(key: key);

  @override
  _VideoMeetingPageState createState() => _VideoMeetingPageState();
}

class _VideoMeetingPageState extends State<VideoMeetingPage> {
  int remoteTextureId = -1;

  // @override
  // void initState() {
  //   super.initState();
  //   initEngine();
  // }
  //
  // Future<void> initEngine() async {
  //   ZegoEngineProfile profile = ZegoEngineProfile(
  //     491061320, // Replace with your actual AppID
  //     ZegoScenario.General,
  //     enablePlatformView: true,
  //   );
  //
  //   await ZegoExpressEngine.createEngineWithProfile(profile);
  //
  //   ZegoUser user = ZegoUser.id(widget.doctorName); // Use doctorName as user ID
  //   ZegoRoomConfig config = ZegoRoomConfig.defaultConfig();
  //   config.isUserStatusNotify = true;
  //   config.token = getToken(); // Replace with your token retrieval logic
  //
  //   ZegoExpressEngine.instance.loginRoom('room1', user, config: config);
  //
  //   ZegoExpressEngine.onRoomTokenWillExpire = (String roomID, int remainTimeInSecond) {
  //     String token = getToken(); // Replace with your token retrieval logic
  //     ZegoExpressEngine.instance.renewToken(roomID, token);
  //   };
  // }
  //
  // String getToken() {
  //   // Implement your logic to retrieve a new token from your app server
  //   return widget.randomNumber.toString();
  // }
  //
  // void onRemoteStreamUpdated() {
  //   // After you have received the remote video stream, you can get the texture ID.
  //   ZegoExpressEngine.instance.startPlayingStream(widget.doctorName);
  //   setState(() {
  //     remoteTextureId = ZegoExpressEngine.instance.createTextureView();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Meeting with ${widget.doctorName}'),
      ),
    );
  }

  @override
  void dispose() {
    // Cleanup code here if needed
    super.dispose();
  }
}

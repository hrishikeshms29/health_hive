import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class JMeet extends StatefulWidget {
  final String roomId;
  final String userName;

  const JMeet({Key? key, required this.roomId, required this.userName}) : super(key: key);

  @override
  State<JMeet> createState() => _JMeetState();
}

class _JMeetState extends State<JMeet> {
  bool audioMuted = true;
  bool videoMuted = true;
  bool screenShareOn = false;
  List<String> participants = [];
  final _jitsiMeetPlugin = JitsiMeet();

  @override
  void initState() {
    super.initState();
    join();
  }

  join() async {
    try {
      var options = JitsiMeetConferenceOptions(
        room: widget.roomId,
        configOverrides: {
          "startWithAudioMuted": true,
          "startWithVideoMuted": true,
        },
        featureFlags: {
          FeatureFlags.addPeopleEnabled: true,
          FeatureFlags.welcomePageEnabled: true,
          FeatureFlags.preJoinPageEnabled: true,
          FeatureFlags.unsafeRoomWarningEnabled: true,
          FeatureFlags.resolution: FeatureFlagVideoResolutions.resolution720p,
          FeatureFlags.audioFocusDisabled: true,
          FeatureFlags.audioMuteButtonEnabled: true,
          FeatureFlags.audioOnlyButtonEnabled: true,
          FeatureFlags.calenderEnabled: true,
          FeatureFlags.callIntegrationEnabled: true,
          FeatureFlags.carModeEnabled: true,
          FeatureFlags.closeCaptionsEnabled: true,
          FeatureFlags.conferenceTimerEnabled: true,
          FeatureFlags.chatEnabled: true,
          FeatureFlags.filmstripEnabled: true,
          FeatureFlags.fullScreenEnabled: true,
          FeatureFlags.helpButtonEnabled: true,
          FeatureFlags.inviteEnabled: true,
          FeatureFlags.androidScreenSharingEnabled: true,
          FeatureFlags.speakerStatsEnabled: true,
          FeatureFlags.kickOutEnabled: true,
          FeatureFlags.liveStreamingEnabled: true,
          FeatureFlags.lobbyModeEnabled: true,
          FeatureFlags.meetingNameEnabled: true,
          FeatureFlags.meetingPasswordEnabled: true,
          FeatureFlags.notificationEnabled: true,
          FeatureFlags.overflowMenuEnabled: true,
          FeatureFlags.pipEnabled: true,
          FeatureFlags.pipWhileScreenSharingEnabled: true,
          FeatureFlags.preJoinPageHideDisplayName: true,
          FeatureFlags.raiseHandEnabled: true,
          FeatureFlags.reactionsEnabled: true,
          FeatureFlags.recordingEnabled: true,
          FeatureFlags.replaceParticipant: true,
          FeatureFlags.securityOptionEnabled: true,
          FeatureFlags.serverUrlChangeEnabled: true,
          FeatureFlags.settingsEnabled: true,
          FeatureFlags.tileViewEnabled: true,
          FeatureFlags.videoMuteEnabled: true,
          FeatureFlags.videoShareEnabled: true,
          FeatureFlags.toolboxEnabled: true,
          FeatureFlags.iosRecordingEnabled: true,
          FeatureFlags.iosScreenSharingEnabled: true,
          FeatureFlags.toolboxAlwaysVisible: true,
        },
      );

      var listener = JitsiMeetEventListener(
        conferenceJoined: (url) {
          debugPrint("conferenceJoined: url: $url");
        },
        conferenceTerminated: (url, error) {
          debugPrint("conferenceTerminated: url: $url, error: $error");
        },
        conferenceWillJoin: (url) {
          debugPrint("conferenceWillJoin: url: $url");
        },
        participantJoined: (email, name, role, participantId) {
          debugPrint(
            "participantJoined: email: $email, name: $name, role: $role, "
                "participantId: $participantId",
          );
          participants.add(participantId!);
        },
        participantLeft: (participantId) {
          debugPrint("participantLeft: participantId: $participantId");
        },
        audioMutedChanged: (muted) {
          debugPrint("audioMutedChanged: isMuted: $muted");
        },
        videoMutedChanged: (muted) {
          debugPrint("videoMutedChanged: isMuted: $muted");
        },
        endpointTextMessageReceived: (senderId, message) {
          debugPrint(
              "endpointTextMessageReceived: senderId: $senderId, message: $message");
        },
        screenShareToggled: (participantId, sharing) {
          debugPrint(
            "screenShareToggled: participantId: $participantId, "
                "isSharing: $sharing",
          );
        },
        chatMessageReceived: (senderId, message, isPrivate, timestamp) {
          debugPrint(
            "chatMessageReceived: senderId: $senderId, message: $message, "
                "isPrivate: $isPrivate, timestamp: $timestamp",
          );
        },
        chatToggled: (isOpen) => debugPrint("chatToggled: isOpen: $isOpen"),
        participantsInfoRetrieved: (participantsInfo) {
          debugPrint(
              "participantsInfoRetrieved: participantsInfo: $participantsInfo, ");
        },
        readyToClose: () {
          debugPrint("readyToClose");
        },
      );

      await _jitsiMeetPlugin.join(options, listener);
    } catch (error) {
      print("Error joining meeting: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: join,
                child: const Text("Join"),
              ),
              TextButton(onPressed: hangUp, child: const Text("Hang Up")),
              Row(children: [
                const Text("Set Audio Muted"),
                Checkbox(
                  value: audioMuted,
                  onChanged: setAudioMuted,
                ),
              ]),
              Row(children: [
                const Text("Set Video Muted"),
                Checkbox(
                  value: videoMuted,
                  onChanged: setVideoMuted,
                ),
              ]),
              TextButton(
                  onPressed: sendEndpointTextMessage,
                  child: const Text("Send Hey Endpoint Message To All")),
              Row(children: [
                const Text("Toggle Screen Share"),
                Checkbox(
                  value: screenShareOn,
                  onChanged: toggleScreenShare,
                ),
              ]),
              TextButton(
                  onPressed: openChat, child: const Text("Open Chat")),
              TextButton(
                  onPressed: sendChatMessage,
                  child: const Text("Send Chat Message to All")),
              TextButton(
                  onPressed: closeChat, child: const Text("Close Chat")),
              TextButton(
                onPressed: retrieveParticipantsInfo,
                child: const Text("Retrieve Participants Info"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void hangUp() async {
    await _jitsiMeetPlugin.hangUp();
  }

  void setAudioMuted(bool? muted) async {
    var a = await _jitsiMeetPlugin.setAudioMuted(muted!);
    debugPrint("$a");
    setState(() {
      audioMuted = muted;
    });
  }

  void setVideoMuted(bool? muted) async {
    var a = await _jitsiMeetPlugin.setVideoMuted(muted!);
    debugPrint("$a");
    setState(() {
      videoMuted = muted;
    });
  }

  void sendEndpointTextMessage() async {
    var a = await _jitsiMeetPlugin.sendEndpointTextMessage(message: "HEY");
    debugPrint("$a");

    for (var p in participants) {
      var b = await _jitsiMeetPlugin.sendEndpointTextMessage(to: p, message: "HEY");
      debugPrint("$b");
    }
  }

  void toggleScreenShare(bool? enabled) async {
    await _jitsiMeetPlugin.toggleScreenShare(enabled!);

    setState(() {
      screenShareOn = enabled;
    });
  }

  void openChat() async {
    await _jitsiMeetPlugin.openChat();
  }

  void sendChatMessage() async {
    var a = await _jitsiMeetPlugin.sendChatMessage(message: "HEY1");
    debugPrint("$a");

    for (var p in participants) {
      a = await _jitsiMeetPlugin.sendChatMessage(to: p, message: "HEY2");
      debugPrint("$a");
    }
  }

  void closeChat() async {
    await _jitsiMeetPlugin.closeChat();
  }

  void retrieveParticipantsInfo() async {
    var a = await _jitsiMeetPlugin.retrieveParticipantsInfo();
    debugPrint("$a");
  }
}

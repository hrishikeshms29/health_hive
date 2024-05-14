import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key, required this.callID, required this.userName})
      : super(key: key);
  final String callID;

  final String userName;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.callID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Call ID: ${widget.callID}'),
              Text('User ID: $uid'),
              Text('User Name: ${widget.userName}'),
            ],
          ),
        ),
      ),
    );
  }
}

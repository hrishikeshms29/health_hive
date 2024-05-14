import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:health_hive/views/login_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Add the import for ZegoExpressEngine

void main() async {
  // Initialize ZegoExpressEngine
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize Firebase:
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Firebase initialization error: ${snapshot.error}');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text('Firebase Initialization Error'),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginView(),
          );
        }

        // Otherwise, show loading screen
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  static Future<void> _initializeFirebase() async {
    // Wrap Firebase.initializeApp in a try-catch block to handle any errors
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (error) {
      print('Firebase initialization error: $error');
      throw error; // Rethrow the error to be caught by the FutureBuilder
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:health_hive/views/home_view/home_view.dart';

import '../views/lo.dart';

class AuthController extends GetxController {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signupUser(String emailAddress, String password) async {
    try {
      if (emailAddress.isEmpty) {
        Fluttertoast.showToast(msg: 'Email address is empty.', backgroundColor: Colors.red);
        return;
      }

      print('Signing up with email: $emailAddress');

      final UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null) {
        await storeUserData(credential.user!.uid, fullnameController.text, emailAddress);
        Fluttertoast.showToast(msg: 'User signed up successfully.', backgroundColor: Colors.green);
        Get.offAll(() => HomeView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.', backgroundColor: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'The account already exists for that email.', backgroundColor: Colors.red);
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: 'The email address is badly formatted.', backgroundColor: Colors.red);
      } else {
        Fluttertoast.showToast(msg: 'Firebase Auth Exception: ${e.message}', backgroundColor: Colors.red);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: $e', backgroundColor: Colors.red);
    }
  }

  Future<void> storeUserData(String uid, String fullname, String emailAddress) async {
    try {
      final CollectionReference users = FirebaseFirestore.instance.collection('users');
      await users.doc(uid).set({
        'fullname': fullname,
        'email': emailAddress,
      });
      Fluttertoast.showToast(msg: 'User data stored successfully.', backgroundColor: Colors.green);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error storing user data: $e', backgroundColor: Colors.red);
    }
  }

  Future<void> login(String emailAddress, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null) {
        Fluttertoast.showToast(msg: 'User logged in successfully.', backgroundColor: Colors.green);
        Get.offAll(() => HomeView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.', backgroundColor: Colors.red);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.', backgroundColor: Colors.red);
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(msg: 'The email address is badly formatted.', backgroundColor: Colors.red);
      } else {
        Fluttertoast.showToast(msg: 'Firebase Auth Exception: ${e.message}', backgroundColor: Colors.red);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: $e', backgroundColor: Colors.red);
    }
  }
  Future<void> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Fluttertoast.showToast(msg: 'User signed out successfully.', backgroundColor: Colors.green);
      Get.offAll(() => LoginView()); // Navigate to the login screen after signing out
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error signing out: $e', backgroundColor: Colors.red);
    }
  }
  @override
  void onClose() {
    // Clean up text controllers
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

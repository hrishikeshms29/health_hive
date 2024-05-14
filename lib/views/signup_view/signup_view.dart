import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hive/consts/consts.dart';
import 'package:health_hive/controllers/auth_controller.dart';
import 'package:health_hive/res/components/custom_textfield.dart';
import 'package:health_hive/views/login_view.dart';

import '../home_view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Hive',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Serif',
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          bodyText1: TextStyle(
            fontFamily: 'SansSerif',
            color: Colors.black87,
          ),
        ),
      ),
      home: const SignupView(),
    );
  }
}

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.zero,
          color: colorScheme.background,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Center(
                child: Image.asset(logo, width: 200), // Replace with your logo asset path
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            hint: "Enter Name ",
                            icon: Icons.man,
                            textController: controller.fullnameController,
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            hint: "Enter your Email",
                            icon: Icons.email,
                            textController: controller.emailController,
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            hint: "Enter your Password",
                            icon: Icons.lock,
                            textController: controller.passwordController,
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            hint: "Confirm your Password",
                            icon: Icons.lock_outline,
                          ),
                          SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () async {
                              String email = controller.emailController.text.trim();
                              String password = controller.passwordController.text.trim();
                              await controller.signupUser(email, password);
                            },
                            child: Text('Sign Up'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: colorScheme.onPrimary,
                              backgroundColor: colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextButton(
                            onPressed: () {
                              Get.to(LoginView());
                            },
                            child: Text(
                              "Already have an account? Log in",
                              style: TextStyle(
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

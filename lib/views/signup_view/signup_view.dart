import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_hive/consts/consts.dart';
import 'package:health_hive/res/components/custom_textfield.dart';
import 'package:health_hive/views/login_view.dart';

import '../home_view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
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
                                  hint: "Enter your Email",
                                  icon: Icons.email,
                                ),
                                SizedBox(height: 16),
                                CustomTextField(
                                  hint: "Enter your Password",
                                  icon: Icons.lock,
                                ),
                                SizedBox(height: 16),
                                CustomTextField(
                                  hint: "Confirm your Password",
                                  icon: Icons.lock_outline,
                                ),
                                SizedBox(height: 32),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(HomeView());
        
                                    // TODO: Implement sign-up functionality
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
                                    // TODO: Navigate to login screen
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

// Include the AnimatedLoginButton class here


// Include the AnimatedLoginButton class here
//
// class AnimatedLoginButton extends StatefulWidget {
//   const AnimatedLoginButton({super.key});
//
//   @override
//   State<AnimatedLoginButton> createState() => _AnimatedLoginButtonState();
// }
//
// class _AnimatedLoginButtonState extends State<AnimatedLoginButton> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Offset> _offsetAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(seconds: 1), // Duration for the slide animation
//       vsync: this,
//     );
//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(-1.0, 0.0), // Start from the left side
//       end: Offset.zero, // End at its final position
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeOut, // A curve that starts quickly and ends slowly
//     ));
//
//     _animationController.forward(); // Start the animation
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose(); // Dispose the controller when the widget is removed
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _offsetAnimation,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: StadiumBorder(), // Rounded corners for the button
//         ),
//         onPressed: () {
//           // TODO: Implement login functionality
//         },
//         child: const Text("Login"),
//       ),
//     );
//   }
// }

// Include the AnimatedLoginButton class here

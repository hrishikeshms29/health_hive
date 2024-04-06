import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_hive/consts/consts.dart';
import 'package:health_hive/res/components/custom_textfield.dart';
import 'package:health_hive/views/home_view/home_view.dart';
import 'package:health_hive/views/signup_view/signup_view.dart';

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
      home: const LoginView(),
    );
  }
}
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.zero,
        color: colorScheme.background,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Center(
              child: Image.asset(logo, width: 200), // Replace with your logo asset path
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
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
                              icon: Icons.email, // Add email icon
                            ),
                            SizedBox(height: 16),
                            CustomTextField(
                              hint: "Please enter your Password",
                              icon: Icons.lock, // Add lock icon
                            ),

                            SizedBox(height: 32),

                            AnimatedLoginButton(), // Use the AnimatedLoginButton class from earlier
                            SizedBox(height: 32),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     Get.to(() => const SignupView());
                            //   },
                            //   child: Text('Sign Up'),
                            //   style: ElevatedButton.styleFrom(
                            //     foregroundColor: colorScheme.onPrimary, backgroundColor: colorScheme.primary,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(30.0),
                            //     ),
                            //     padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                            //   ),
                            // ),0
                            // SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Get.to(HomeView());
                                  },
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                      color: colorScheme.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const SignupView());
                                  },
                                  child: Text(
                                    "Don't have an account? Sign up",
                                    style: TextStyle(
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Include the AnimatedLoginButton class here


// Include the AnimatedLoginButton class here
class AnimatedLoginButton extends StatefulWidget {
  const AnimatedLoginButton({super.key});

  @override
  State<AnimatedLoginButton> createState() => _AnimatedLoginButtonState();
}

class _AnimatedLoginButtonState extends State<AnimatedLoginButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1), // Duration for the slide animation
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start from the left side
      end: Offset.zero, // End at its final position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut, // A curve that starts quickly and ends slowly
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8, // Start scale
      end: 1.0, // End scale
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), // Rounded corners for the button
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          ),
          onPressed: () {
            // TODO: Implement login functionality
            Get.to(const HomeView());
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}

// Include the AnimatedLoginButton class here

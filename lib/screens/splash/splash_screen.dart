import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, "home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/geeta.jpg",
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 10,),
            const Text(
              "|| भगवद् गीता ||",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

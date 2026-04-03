import 'dart:async';

import 'package:counterapp/counter_screen.dart';
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
    Future.delayed(Duration(seconds: 2),(){
      if (mounted) {
        // Use pushAndRemoveUntil instead of pushReplacement for better compatibility
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (context)=> CounterScreen()),
          (route) => false
        );
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // 🔹 Center Image
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/splash.png', // 👈 apni image path
                height: 150,
              ),
            ),
          ),

          // 🔹 Bottom Loader
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Loading..."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
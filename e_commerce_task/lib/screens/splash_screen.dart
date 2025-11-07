import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    var duration = Duration(seconds: 4);
    Timer(duration, navigateToHome);
  }
  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(166, 21, 130, 207),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.6,
            image: AssetImage('assets/images/aa003ca3-01ea-423e-8d47-12dd1d97fd7a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/log.png',
                      width: 180,
                      height: 180,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Text(
                        'E-COMMERCE APP',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black45,
                            ),
                          ]
                        )
                        
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
              ],
            ),
          ),
      )
    );
  }
}
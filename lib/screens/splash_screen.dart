import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather1_app/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
@override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3) ,(){
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder:(_)=> const WelcomeScreen() ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays : SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const  BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/weather_splash.png"),
          fit: BoxFit.fill
        ),
        ),
      ),
    );
  }
}

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/views/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 200,
      logo: Image.asset('assets/images/Logo.png'),
      title: const Text(
        "PROJETO FINAL NESSA BOMBA!",
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loaderColor: Color.fromARGB(255, 88, 22, 16),
      loadingText: const Text(
        "Carregando...",
        style: TextStyle(
          color: Color.fromARGB(255, 165, 65, 47),
        ),
      ),
      navigator: const HomeScreen(),
      durationInSeconds: 5,
    );
  }
}

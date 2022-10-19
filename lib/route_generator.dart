import 'package:flutter/material.dart';
import 'package:projeto_final/views/Doors.dart';
import 'package:projeto_final/views/control_panel.dart';
import 'package:projeto_final/views/history.dart';
import 'package:projeto_final/views/reservoir.dart';
import 'package:projeto_final/views/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case "/splash":
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case "/control":
        return MaterialPageRoute(builder: (_) => const ControlPanel());

      case "/history":
        return MaterialPageRoute(builder: (_) => const History());

      case "/reservoir":
        return MaterialPageRoute(builder: (_) => const Reservoir());

      case "/doors":
        return MaterialPageRoute(builder: (_) => const Doors());
        
      default:
        _erroRota();
    }

    throw '';
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Erro de rota"),
        ),
        body: const Text("Tela não encontrada"),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:projeto_final/route_generator.dart';

void main() {

  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: const Color(0xFF0f928c),
      scaffoldBackgroundColor: Colors.white,
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    onGenerateRoute: RouteGenerator.generateRoute,

  ) );
  
}
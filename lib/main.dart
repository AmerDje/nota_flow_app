import 'package:flutter/material.dart';

void main() async {
  runApp(
    const NotaFlowApp(),
  );
}

class NotaFlowApp extends StatelessWidget {
  const NotaFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const Scaffold(),
    );
  }
}

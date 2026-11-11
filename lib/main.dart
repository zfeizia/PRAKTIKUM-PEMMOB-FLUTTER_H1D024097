import 'package:flutter/material.dart';
import 'package:belajarflutter/login_page.dart'; // Sesuaikan dengan nama projectmu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        useMaterial3: false, // Mematikan tema Material 3 agar kembali ke style klasik modul
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
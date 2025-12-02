import 'package:flutter/material.dart';
import 'package:flutter_project/views/home_view.dart';
import 'package:flutter_project/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginView(),
      routes: {
        "/homePage": (context) => const HomeView(),
        "/loginPage": (context) => const LoginView(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio dio = Dio();
  List<dynamic> posts = [];
  bool isLoading = false;
  String? error;

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchPosts() async {}

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.deepPurple);
  }
}

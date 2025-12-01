import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project/providers/post_provider.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(color: Colors.deepPurple)),
        backgroundColor: Colors.white,
      ),
      body: ChangeNotifierProvider(
        create: (context) => PostsProvider()..fetchPosts(),
        child: const PostsScreen(),
      ),
    );
  }
}

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(
      builder: (context, postsProvider, child) {
        if (postsProvider.isLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (postsProvider.posts.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('No posts found.'),
            ),
          );
        }

        return ListView.builder(
          itemCount: postsProvider.posts.length,
          itemBuilder: (context, index) {
            final post = postsProvider.posts[index];
            return Card(
              margin: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: Image.asset("assets/images/icon.png"),
                title: Text(post.name),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

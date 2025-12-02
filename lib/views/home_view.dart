import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel()..fetchPosts(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Home", style: TextStyle(color: Colors.deepPurple)),
          backgroundColor: Colors.white,
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (viewModel.error != null) {
              return Center(child: Text('Error: ${viewModel.error}'));
            }

            if (viewModel.posts.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('No posts found.'),
                ),
              );
            }

            return ListView.builder(
              itemCount: viewModel.posts.length,
              itemBuilder: (context, index) {
                final post = viewModel.posts[index];
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
        ),
      ),
    );
  }
}

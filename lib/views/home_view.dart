import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import '../models/post.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel()..fetchPosts(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: HomeAppBar(),
        body: HomeBody(),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Home", style: TextStyle(color: Colors.deepPurple)),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) return const HomeLoadingView();
        if (viewModel.error != null) {
          return HomeErrorView(error: viewModel.error!);
        }
        if (viewModel.posts.isEmpty) return const HomeEmptyView();
        return HomePostsList(posts: viewModel.posts);
      },
    );
  }
}

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class HomeErrorView extends StatelessWidget {
  final String error;
  const HomeErrorView({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error: $error'));
  }
}

class HomeEmptyView extends StatelessWidget {
  const HomeEmptyView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text('No posts found.'),
      ),
    );
  }
}

class HomePostsList extends StatelessWidget {
  final List<Post> posts;
  const HomePostsList({required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return HomePostCard(post: post);
      },
    );
  }
}

class HomePostCard extends StatelessWidget {
  final Post post;
  const HomePostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: Image.asset("assets/images/icon.png"),
        title: Text(post.name),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Post {
  final int id;
  final String name;
  final String body;

  Post({required this.id, required this.name, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'] as int,
    name: json['title'] as String,
    body: json['body'] as String,
  );
}

class PostsProvider extends ChangeNotifier {
  final _dio = Dio();
  List<Post> _posts = [];
  bool _isLoading = false;
  String? _error;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPosts() async {
    setLoading(true);

    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts?_limit=15',
        options: Options(
          headers: {
            'User-Agent': 'FlutterApp/1.0',
            'Accept': 'application/json',
          },
          validateStatus: (status) => status! < 500,
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        _posts = data.map((json) => Post.fromJson(json)).toList();
        _error = null;
        print('Fetched ${_posts.length} posts');
      }
    } catch (e) {
      _error = "Error: $e";
      print(_error);
    } finally {
      setLoading(false);
    }
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}

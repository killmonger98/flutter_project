import 'package:flutter/foundation.dart';
import '../models/post.dart';
import '../services/post_service.dart';

class HomeViewModel extends ChangeNotifier {
  final PostService _service = PostService();

  List<Post> _posts = [];
  bool _isLoading = false;
  String? _error;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _posts = await _service.fetchPosts();
      _error = null;
    } catch (e) {
      _error = "Error: $e";
      _posts = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}

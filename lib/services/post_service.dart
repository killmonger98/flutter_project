import '../models/post.dart';
import '../network/network_client.dart';
import '../network/api_endpoints.dart';

class PostService {
  final NetworkClient _networkClient = NetworkClient();

  Future<List<Post>> fetchPosts() async {
    final response = await _networkClient.get(
      ApiEndpoints.posts,
      queryParameters: {'_limit': 15},
    );

    final List<dynamic> data = response.data;
    return data.map((json) => Post.fromJson(json)).toList();
  }
}

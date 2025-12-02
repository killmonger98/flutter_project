class ApiEndpoints {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static const String posts = '/posts';
  static String postById(int id) => '/posts/$id';
}

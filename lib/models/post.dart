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

  Map<String, dynamic> toJson() => {'id': id, 'title': name, 'body': body};
}

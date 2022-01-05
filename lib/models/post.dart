class Post {
  String postId;
  final String description;
  final String imageUrl;
  final String path;
  final String title;
  final List<String> tags;

  Post({
    this.postId = '',
    this.description = '',
    this.imageUrl = '',
    this.path = '',
    this.title = '',
    this.tags = const [],
  });

  factory Post.fromData(Map<String, dynamic>? data) {
    if (data == null) return Post();
    return Post(
        description: data['description'] as String,
        imageUrl: data['image'] as String,
        path: data['path'] as String,
        title: data['title'] as String,
        tags: data['tags'] as List<String>);
  }
}

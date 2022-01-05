class Post {
  String postId;
  String description;
  String imageUrl;
  String path;
  String title;
  List<String> tags;

  Post({
    required this.postId,
    required this.description,
    required this.imageUrl,
    required this.path,
    required this.title,
    required this.tags,
  });
}

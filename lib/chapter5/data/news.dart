class News {
  late String title;
  late String description;
  late String imageUrl;

  News(
      {required this.title, required this.description, required this.imageUrl});

  News.fromMap(Map<String, dynamic>? map) {
    title = map?['title'] ?? '';
    description = map?['description'] ?? '';
    imageUrl = map?['urlToImage'] ?? '';
  }
  String toString() {
    return "title: $title, description: $description, imageUrl: $imageUrl";
  }
}

class Music {
  late String title;
  late String downloadPage;

  Music({required this.title, required this.downloadPage});

  Music.fromMap(Map<String, dynamic>? map) {
    title = map?['name'] ?? '';
    downloadPage = map?['downloadPage'] ?? '';
  }
}

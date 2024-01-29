class Book {
  String author;
  String id;
  String title;
  DateTime timestamp;

  Book({
    required this.author,
    required this.id,
    required this.title,
    required this.timestamp,
  });

  Book copyWith({
    String? title,
  }) {
    return Book(
      author: this.author,
      id: this.id,
      title: title ?? this.title,
      timestamp: this.timestamp,
    );
  }
}
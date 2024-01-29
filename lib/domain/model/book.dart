class Book {
  String author;
  String id;
  String title;

  Book({
    required this.author,
    required this.id,
    required this.title,
  });

  Book copyWith({
    String? title,
  }) {
    return Book(
      author: this.author,
      id: this.id,
      title: title ?? this.title,
    );
  }
}
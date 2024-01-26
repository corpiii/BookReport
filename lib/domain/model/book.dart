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
    String? author,
    String? id,
    String? title,
  }) {
    return Book(
      author: author ?? this.author,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
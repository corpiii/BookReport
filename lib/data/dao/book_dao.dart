class BookDAO {
  final String id;
  final String author;
  final String title;

  BookDAO({
    required this.id,
    required this.author,
    required this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'author': this.author,
      'title': this.title,
    };
  }

  factory BookDAO.fromJson(Map<String, dynamic> map) {
    return BookDAO(
      id: map['id'] as String,
      author: map['author'] as String,
      title: map['title'] as String,
    );
  }
}
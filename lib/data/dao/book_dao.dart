class BookDAO {
  final String id;
  final String author;
  final String title;
  final String timestamp;

  BookDAO({
    required this.id,
    required this.author,
    required this.title,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'author': this.author,
      'title': this.title,
      'timestamp' : this.timestamp,
    };
  }

  factory BookDAO.fromJson(Map<String, dynamic> map) {
    return BookDAO(
      id: map['id'] as String,
      author: map['author'] as String,
      title: map['title'] as String,
      timestamp: map['timestamp'] as String
    );
  }
}
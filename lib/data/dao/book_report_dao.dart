class BookReportDAO {
  String id;
  String author;
  String title;
  String content;
  String timestamp;

  BookReportDAO({
    required this.id,
    required this.author,
    required this.title,
    required this.content,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'author': this.author,
      'title': this.title,
      'content': this.content,
      'timestamp': this.timestamp,
    };
  }

  factory BookReportDAO.fromJson(Map<String, dynamic> map) {
    return BookReportDAO(
      id: map['id'] as String,
      author: map['author'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      timestamp: map['timestamp'] as String,
    );
  }
}
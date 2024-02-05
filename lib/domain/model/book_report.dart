class BookReport {
  String id;
  String title;
  String content;
  DateTime dateTime;
  String author;

  BookReport({
    required this.id,
    required this.title,
    required this.content,
    required this.dateTime,
    required this.author,
  });

  BookReport copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? dateTime,
    String? author,
  }) {
    return BookReport(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      dateTime: dateTime ?? this.dateTime,
      author: author ?? this.author,
    );
  }
}
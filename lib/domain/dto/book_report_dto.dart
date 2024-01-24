class BookReportDTO {
  String id;
  String author;
  String title;
  String content;
  DateTime dateTime;

  BookReportDTO({
    required this.id,
    required this.author,
    required this.title,
    required this.content,
    required this.dateTime,
  });
}
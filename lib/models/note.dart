class Note {
  Note({required this.title, required this.content, required this.date});

  final String title;
  final String content;
  final String date;

  toJson() {
    return {
      'title': title,
      'content': content,
      'date': date,
    };
  }

  static Note fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}

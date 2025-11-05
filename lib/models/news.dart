class News {
  final int id;
  final String title;
  final String project;
  final String date;
  final String image;

  News({
    required this.id,
    required this.title,
    required this.project,
    required this.date,
    required this.image,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'] ?? '',
      project: json['project'] ?? '',
      date: json['date'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class Project {
  final int id;
  final String projectName;
  final String location;
  final String status;
  final String description;
  final String imageUrl;

  Project({
    required this.id,
    required this.projectName,
    required this.location,
    required this.status,
    required this.description,
    required this.imageUrl,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      projectName: json['project_name'] ?? '',
      location: json['location'] ?? '',
      status: json['status'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['main_image'] ?? '',
    );
  }
}

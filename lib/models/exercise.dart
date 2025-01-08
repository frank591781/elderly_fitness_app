class Exercise {
  final String category;
  final String title;
  final String frontVideoPath;
  final String sideVideoPath;
  final String description;
  final String points;
  final String precautions;

  Exercise({
    required this.category,
    required this.title,
    required this.frontVideoPath,
    required this.sideVideoPath,
    required this.description,
    required this.points,
    required this.precautions,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      category: json['category'],
      title: json['title'],
      frontVideoPath: json['frontVideoPath'],
      sideVideoPath: json['sideVideoPath'],
      description: json['description'],
      points: json['points'],
      precautions: json['precautions'],
    );
  }
} 
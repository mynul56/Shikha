class Course {
  final String id;
  final String title;
  final String description;
  final String thumbnail;
  final String instructorName;
  final double price;
  final double rating;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.instructorName,
    required this.price,
    required this.rating,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'] ?? '',
      title: json['title'] ?? 'Untitled Course',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      instructorName: json['user'] != null
          ? json['user']['name']
          : 'Unknown Instructor',
      price: (json['price'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
}

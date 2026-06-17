class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String profilePicture;
  final String bio;
  final List<String> skills;
  final double rating;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.bio,
    required this.skills,
    required this.rating,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profilePicture: json['profilePicture'] as String,
      bio: json['bio'] as String,
      skills: List<String>.from(json['skills']),
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'bio': bio,
      'skills': skills,
      'rating': rating,
    };
  }
}
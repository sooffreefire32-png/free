class Profile {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final List<String> skills;
  final String bio;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.skills,
    required this.bio,
  });

  @override
  List<Object?> get props => [id, name, email, avatarUrl, skills, bio];
}
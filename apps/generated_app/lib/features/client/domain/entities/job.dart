class Job {
  final String id;
  final String title;
  final String description;
  final double budget;
  final List<String> requiredSkills;
  final String clientId;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.budget,
    required this.requiredSkills,
    required this.clientId,
  });
}
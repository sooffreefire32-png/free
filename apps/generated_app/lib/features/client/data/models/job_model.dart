class JobModel {
  final String id;
  final String title;
  final String description;
  final double budget;
  final String jobType;
  final List<String> requiredSkills;
  final String clientId;

  JobModel({
    required this.id,
    required this.title,
    required this.description,
    required this.budget,
    required this.jobType,
    required this.requiredSkills,
    required this.clientId,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      budget: json['budget'].toDouble(),
      jobType: json['jobType'],
      requiredSkills: List<String>.from(json['requiredSkills']),
      clientId: json['clientId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'budget': budget,
      'jobType': jobType,
      'requiredSkills': requiredSkills,
      'clientId': clientId,
    };
  }
}
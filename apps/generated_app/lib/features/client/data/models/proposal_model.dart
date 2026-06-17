class ProposalModel {
  final String id;
  final String jobId;
  final String freelancerId;
  final String coverLetter;
  final double bidAmount;
  final String status;

  ProposalModel({
    required this.id,
    required this.jobId,
    required this.freelancerId,
    required this.coverLetter,
    required this.bidAmount,
    required this.status,
  });

  factory ProposalModel.fromJson(Map<String, dynamic> json) {
    return ProposalModel(
      id: json['id'],
      jobId: json['jobId'],
      freelancerId: json['freelancerId'],
      coverLetter: json['coverLetter'],
      bidAmount: json['bidAmount'].toDouble(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobId': jobId,
      'freelancerId': freelancerId,
      'coverLetter': coverLetter,
      'bidAmount': bidAmount,
      'status': status,
    };
  }
}
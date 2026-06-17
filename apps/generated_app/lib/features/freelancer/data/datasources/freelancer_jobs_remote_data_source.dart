import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/strings.dart';
import '../../domain/entities/job.dart';
import '../models/job_model.dart';

class FreelancerJobsRemoteDataSource {
  final http.Client client;

  FreelancerJobsRemoteDataSource({required this.client});

  Future<List<Job>> fetchJobsFeed() async {
    final response = await client.get(Uri.parse('$BASE_URL/api/jobs'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((job) => JobModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to fetch jobs feed');
    }
  }

  Future<void> submitProposal(String jobId, String proposalText, double bidAmount) async {
    final response = await client.post(
      Uri.parse('$BASE_URL/api/jobs/$jobId/proposals'),
      body: jsonEncode({
        'proposal_text': proposalText,
        'bid_amount': bidAmount,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to submit proposal');
    }
  }
}
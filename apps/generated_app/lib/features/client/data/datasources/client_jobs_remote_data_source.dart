import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/job_model.dart';

class ClientJobsRemoteDataSource {
  final String baseUrl;
  final http.Client httpClient;

  ClientJobsRemoteDataSource({required this.baseUrl, required this.httpClient});

  Future<List<JobModel>> getClientJobs(String clientId) async {
    final url = Uri.parse('$baseUrl/jobs?clientId=$clientId');
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((job) => JobModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to fetch client jobs');
    }
  }

  Future<void> createJob(JobModel job) async {
    final url = Uri.parse('$baseUrl/jobs');
    final response = await httpClient.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(job.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create job');
    }
  }
}
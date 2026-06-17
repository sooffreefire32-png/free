import 'package:lance_it/features/client/data/models/job_model.dart';

class ClientJobsRepository {
  Future<List<JobModel>> fetchClientJobs(String clientId) async {
    // Mock response (to be replaced with API calls later)
    await Future.delayed(Duration(seconds: 2));
    return [
      JobModel(
        id: '1',
        title: 'Mobile App Design',
        description: 'Design a modern and clean mobile application interface.',
        budget: 500.0,
        jobType: 'Fixed',
        requiredSkills: ['UI/UX', 'Figma', 'Adobe XD'],
        clientId: '12345',
      ),
      JobModel(
        id: '2',
        title: 'E-commerce Website Development',
        description: 'Develop a scalable e-commerce platform.',
        budget: 2000.0,
        jobType: 'Hourly',
        requiredSkills: ['Flutter', 'Firebase'],
        clientId: '12345',
      ),
    ];
  }

  Future<void> createNewJob(JobModel job) async {
    // Mock API action (to be replaced with real backend integration)
    await Future.delayed(Duration(seconds: 2));
    print('Job created: ${job.toJson()}');
  }

  Future<void> deleteJob(String jobId) async {
    // Mock API action (to be replaced with real backend integration)
    await Future.delayed(Duration(seconds: 2));
    print('Job deleted: $jobId');
  }
}

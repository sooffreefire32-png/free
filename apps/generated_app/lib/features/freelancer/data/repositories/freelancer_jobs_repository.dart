import '../../domain/entities/job.dart';
import '../datasources/freelancer_jobs_remote_data_source.dart';

class FreelancerJobsRepository {
  final FreelancerJobsRemoteDataSource remoteDataSource;

  FreelancerJobsRepository({required this.remoteDataSource});

  Future<List<Job>> getJobsFeed() async {
    return await remoteDataSource.fetchJobsFeed();
  }

  Future<void> submitProposal(String jobId, String proposalText, double bidAmount) async {
    await remoteDataSource.submitProposal(jobId, proposalText, bidAmount);
  }
}
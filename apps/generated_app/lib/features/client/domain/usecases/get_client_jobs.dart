import '../entities/job.dart';
import '../../data/repositories/client_jobs_repository.dart';

class GetClientJobs {
  final ClientJobsRepository repository;

  GetClientJobs(this.repository);

  Future<List<Job>> call(String clientId) async {
    return await repository.getClientJobs(clientId);
  }
}
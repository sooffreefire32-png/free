import '../entities/job.dart';
import '../../data/repositories/client_jobs_repository.dart';

class CreateJob {
  final ClientJobsRepository repository;

  CreateJob(this.repository);

  Future<void> call(Job job) async {
    return await repository.createJob(job);
  }
}
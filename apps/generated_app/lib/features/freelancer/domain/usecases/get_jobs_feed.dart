import '../entities/job.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/freelancer_jobs_repository.dart';

class GetJobsFeed {
  final FreelancerJobsRepository repository;

  GetJobsFeed(this.repository);

  Future<Either<Failure, List<Job>>> execute() async {
    return await repository.getJobsFeed();
  }
}
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/freelancer_jobs_repository.dart';

class SubmitProposal {
  final FreelancerJobsRepository repository;

  SubmitProposal(this.repository);

  Future<Either<Failure, bool>> execute(String jobId, String coverLetter, double bidAmount) async {
    return await repository.submitProposal(jobId, coverLetter, bidAmount);
  }
}
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_jobs_feed.dart';
import '../../domain/usecases/submit_proposal.dart';
import '../../domain/entities/job.dart';

part 'freelancer_jobs_event.dart';
part 'freelancer_jobs_state.dart';

class FreelancerJobsBloc extends Bloc<FreelancerJobsEvent, FreelancerJobsState> {
  final GetJobsFeed getJobsFeed;
  final SubmitProposal submitProposal;

  FreelancerJobsBloc({required this.getJobsFeed, required this.submitProposal}) : super(FreelancerJobsInitial());

  @override
  Stream<FreelancerJobsState> mapEventToState(FreelancerJobsEvent event) async* {
    if (event is LoadJobFeedEvent) {
      yield FreelancerJobsLoading();
      final result = await getJobsFeed.execute();
      yield result.fold(
        (failure) => FreelancerJobsError("Failed to load jobs"),
        (jobs) => FreelancerJobsLoaded(jobs),
      );
    } else if (event is SubmitProposalEvent) {
      final result = await submitProposal.execute(event.jobId, event.coverLetter, event.bidAmount);
      yield result.fold(
        (failure) => FreelancerJobsError("Failed to submit proposal"),
        (success) => ProposalSubmitted(),
      );
    }
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/create_job.dart';
import '../../domain/usecases/get_client_jobs.dart';
import '../../domain/entities/job.dart';

part 'client_jobs_event.dart';
part 'client_jobs_state.dart';

class ClientJobsBloc extends Bloc<ClientJobsEvent, ClientJobsState> {
  final CreateJob createJob;
  final GetClientJobs getClientJobs;

  ClientJobsBloc({required this.createJob, required this.getClientJobs}) : super(ClientJobsInitial());

  @override
  Stream<ClientJobsState> mapEventToState(ClientJobsEvent event) async* {
    if (event is FetchClientJobs) {
      yield ClientJobsLoading();
      final result = await getClientJobs(NoParams());
      yield result.fold(
        (failure) => ClientJobsLoadFailure(message: failure.message),
        (jobs) => ClientJobsLoaded(jobs: jobs),
      );
    } else if (event is CreateNewJob) {
      yield ClientJobsLoading();
      final result = await createJob(Params(job: event.job));
      yield result.fold(
        (failure) => ClientJobsLoadFailure(message: failure.message),
        (_) => JobCreated(),
      );
    }
  }
}
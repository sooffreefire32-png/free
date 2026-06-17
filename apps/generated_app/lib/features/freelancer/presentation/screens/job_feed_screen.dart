import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/freelancer_jobs_bloc.dart';
import '../widgets/job_feed_list.dart';

class JobFeedScreen extends StatelessWidget {
  static const routeName = '/job-feed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Feed'),
      ),
      body: BlocProvider(
        create: (_) => FreelancerJobsBloc(
          getJobsFeed: context.read(),
          submitProposal: context.read(),
        )..add(LoadJobFeedEvent()),
        child: BlocBuilder<FreelancerJobsBloc, FreelancerJobsState>(
          builder: (context, state) {
            if (state is FreelancerJobsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FreelancerJobsLoaded) {
              return JobFeedList(jobs: state.jobs);
            } else if (state is FreelancerJobsError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('Unexpected Error'));
            }
          },
        ),
      ),
    );
  }
}
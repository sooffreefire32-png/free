import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/client_jobs_bloc.dart';

class ManageJobsScreen extends StatelessWidget {
  const ManageJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Jobs'),
      ),
      body: BlocBuilder<ClientJobsBloc, ClientJobsState>(
        builder: (context, state) {
          if (state is ClientJobsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ClientJobsLoaded) {
            final jobs = state.jobs;
            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(jobs[index].title),
                  subtitle: Text(jobs[index].description),
                );
              },
            );
          } else if (state is ClientJobsLoadFailure) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No jobs to show'));
        },
      ),
    );
  }
}
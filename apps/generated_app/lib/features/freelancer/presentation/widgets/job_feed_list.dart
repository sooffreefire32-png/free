import 'package:flutter/material.dart';
import '../../data/models/job_model.dart';

class JobFeedList extends StatelessWidget {
  final List<JobModel> jobs;

  const JobFeedList({Key? key, required this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(job.title),
              subtitle: Text(job.description),
              trailing: Text('${job.budget}'),
              onTap: () {
                Navigator.of(context).pushNamed('/job_detail', arguments: job);
              },
            ),
          );
        });
  }
}
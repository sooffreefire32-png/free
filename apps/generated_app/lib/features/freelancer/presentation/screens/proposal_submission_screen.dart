import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../freelancer/presentation/bloc/freelancer_jobs_bloc.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_textfield.dart';

class ProposalSubmissionScreen extends StatelessWidget {
  final String jobId;
  const ProposalSubmissionScreen({Key? key, required this.jobId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _coverLetterController = TextEditingController();
    final TextEditingController _bidAmountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Proposal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _coverLetterController,
                hintText: 'Write your cover letter here...',
                maxLines: 5,
                validator: (value) => value != null && value.isNotEmpty
                    ? null
                    : 'Please enter a cover letter',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bidAmountController,
                hintText: 'Enter bid amount',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bid amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Submit Proposal',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<FreelancerJobsBloc>().add(
                      SubmitProposalEvent(
                        jobId: jobId,
                        coverLetter: _coverLetterController.text,
                        bidAmount: double.parse(_bidAmountController.text),
                      ),
                    );

                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
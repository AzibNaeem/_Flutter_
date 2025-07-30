import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/user_provider.dart';
import '../../theme/app_theme.dart';
import '../../view_model/feedback/feedback_view_model.dart';
import '../../widgets/shimmer/feedback_shimmer.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final user = Provider.of<UserProvider>(context, listen: false).user!;
      final vm = Provider.of<FeedbackViewModel>(context, listen: false);
      await vm.loadFeedbackForm();
      await vm.loadPreviousFeedbacks(user.employeeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user!;
    final feedbackVm = Provider.of<FeedbackViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text("Feedback Form", style: TextStyle(color: AppColors.primary),),
      ),
      body: feedbackVm.isLoading
          ? const FeedbackShimmer()
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("${user.name} (${user.employeeId})",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.primary,  fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),

              // New Feedback Form
              Text("New Feedback",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              ...feedbackVm.formSections.map((section) {
                return Card(
                  color: AppColors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(section.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary)),
                        const SizedBox(height: 12),
                        ...section.questions.map((q) {
                          final isChecked = feedbackVm.isChecked(section.title, q);
                          return GestureDetector(
                            onTap: () {
                              feedbackVm.toggleCheckbox(section.title, q);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isChecked ? AppColors.primary : Colors.grey.shade300,
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      q,
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  if (isChecked)
                                    const Icon(Icons.arrow_forward, color: Colors.black),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              }).toList(),

              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final success = await feedbackVm.submitFeedback(
                        user.employeeId, user.name);
                    final snackBar = SnackBar(
                      content: Text(success
                          ? "✅ Feedback submitted!"
                          : "❌ Submission failed"),
                      backgroundColor: AppColors.white,
                      behavior: SnackBarBehavior.floating,
                    );
                    if (mounted) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                    }
                  },
                  child: const Text("Submit Feedback", style: TextStyle(color: AppColors.white),),
                ),
              ),

              const SizedBox(height: 30),

              // Previously Submitted Feedback
              // Previously Submitted Feedback (Collapsible)
              if (feedbackVm.previousFeedbacks.isNotEmpty) ...[
                ExpansionTile(
                  title: Text("Previous Feedback",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold)),
                  children: feedbackVm.previousFeedbacks.map((submitted) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Submitted on: ${submitted.submittedOn}",
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            ...submitted.feedback.map((fb) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fb.section,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ...fb.selectedOptions.map((opt) => Text("• $opt")),
                                const SizedBox(height: 8),
                              ],
                            )),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],

            ],
          ),
        ),
      ),
    );
  }
}

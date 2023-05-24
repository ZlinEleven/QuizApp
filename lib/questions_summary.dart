import 'package:flutter/material.dart';
import 'package:quiz_app/blueprints/summary_layout.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: summaryData.map(
        (data) {
          return SummaryLayout(
            ((data['question_index'] as int) + 1).toString(),
            data['question'] as String,
            data['selected_answer'] as String,
            data['correct_answer'] as String,
          );
        },
      ).toList(),
    );
  }
}

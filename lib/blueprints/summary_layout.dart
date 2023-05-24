import 'package:flutter/material.dart';

class SummaryLayout extends StatelessWidget {
  const SummaryLayout(this.index, this.prompt, this.selected, this.correct,
      {super.key});

  final String index;
  final String prompt;
  final String selected;
  final String correct;

  @override
  Widget build(context) {
    return Row(
      children: [
        Text(index),
        Expanded(
          child: Column(
            children: [
              Text(prompt),
              const SizedBox(height: 5),
              Text(selected),
              Text(correct),
            ],
          ),
        ),
      ],
    );
  }
}

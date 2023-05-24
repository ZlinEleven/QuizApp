import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/storage/questions.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this.selectedAnswers, this.correctAnswers,
      {super.key, required this.onPressedRestartQuiz});

  final List<String> selectedAnswers;
  final List<String> correctAnswers;
  final void Function() onPressedRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].prompt,
          'correct_answer': questions[i].choices[0],
          'selected_answer': selectedAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summary = getSummaryData();
    final totalQuestions = selectedAnswers.length;
    final correctQuestions = summary.where((data) {
      return data['selected_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $correctQuestions out of $totalQuestions questions correctly!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(209, 229, 200, 238),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionsSummary(summaryData: summary),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: () {
              onPressedRestartQuiz();
            },
            icon: const Icon(Icons.restart_alt),
            label: const Text('Restart Quiz!'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/blueprints/quiz_questions.dart';
import 'package:quiz_app/storage/questions.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage(this.onSelectAnswer, {super.key});

  final void Function(String ans) onSelectAnswer;

  @override
  State<QuestionsPage> createState() {
    return _QuestionsPageState();
  }
}

class _QuestionsPageState extends State<QuestionsPage> {
  int questionNumber = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionNumber += 1;
    });
  }

  @override
  Widget build(context) {
    QuizQuestion question = questions[questionNumber];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.prompt,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 165, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...question.getShuffledAnswers().map(
              (choice) {
                return AnswerButton(
                  () {
                    answerQuestion(choice);
                  },
                  choice,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

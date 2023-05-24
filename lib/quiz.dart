import 'package:flutter/material.dart';
import 'package:quiz_app/questions_page.dart';
import 'package:quiz_app/start_page.dart';
import 'package:quiz_app/storage/questions.dart';
import 'package:quiz_app/result_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

const List<Color> gradientColors = [
  Color.fromARGB(255, 103, 10, 179),
  Color.fromARGB(255, 102, 29, 136)
];

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  final List<String> correctAnswers = [];

  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    selectedAnswers = [];
    activeScreen = StartPage(changeScreen);
  }

  void changeScreen() {
    setState(() {
      activeScreen = QuestionsPage(addSelectedAnswer);
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartPage(changeScreen);
    });
  }

  void addSelectedAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        for (var i = 0; i < questions.length; i++) {
          correctAnswers.add(questions[i].choices[0]);
        }
        activeScreen = ResultPage(selectedAnswers, correctAnswers,
            onPressedRestartQuiz: restartQuiz);
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}

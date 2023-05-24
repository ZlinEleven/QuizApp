import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.onPressedFunction, {super.key});

  final void Function() onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(120, 255, 255, 255),
          ),
          const SizedBox(height: 60),
          const StyledText(
            "Learn Flutter the fun way!",
            Colors.white,
            textSize: 30,
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () {
              onPressedFunction();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}

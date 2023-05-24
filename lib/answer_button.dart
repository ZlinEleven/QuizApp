import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.onPressedFunction, this.choiceText, {super.key});

  final void Function() onPressedFunction;
  final String choiceText;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onPressedFunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 46, 5, 141),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
      ),
      child: Text(
        choiceText,
        textAlign: TextAlign.center,
      ),
    );
  }
}

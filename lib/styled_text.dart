import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, this.textColor, {super.key, this.textSize = 14});

  final String text;
  final Color textColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: textSize),
    );
  }
}

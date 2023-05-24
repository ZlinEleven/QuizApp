import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: (selected == correct
              ? const Color.fromARGB(255, 73, 173, 255)
              : const Color.fromARGB(255, 255, 90, 247)),
          radius: 18,
          child: Text(
            index,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                prompt,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                selected,
                style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 218, 70, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                correct,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 104, 182, 255),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

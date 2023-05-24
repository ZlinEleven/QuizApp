class QuizQuestion {
  const QuizQuestion(this.prompt, this.choices);

  final String prompt;
  final List<String> choices;

  List<String> getShuffledAnswers() {
    final shuffledChoices = List.of(choices);
    shuffledChoices.shuffle();

    return shuffledChoices;
  }
}

class Question {
  final String title;
  final String highlight; // green text
  final List<Option> options;
  String? selectedValue;

  Question({
    required this.title,
    required this.highlight,
    required this.options,
    this.selectedValue,
  });
}

class Option {
  final String value;
  final String label;

  Option({required this.value, required this.label});
}
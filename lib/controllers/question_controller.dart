import '../models/question_model.dart';

class QuestionController {
  int currentIndex = 0;

  final List<Question> questions = [
    Question(
      title: "What is your\n",
      highlight: "main job?",
      options: [
        Option(value: 'delivery_rider', label: 'Delivery Rider (Bike /\nScooter)'),
        Option(value: 'tuk_tuk', label: 'Tuk-tuk Driver'),
        Option(value: 'street_food', label: 'Street Food Vendor'),
        Option(value: 'construction', label: 'Construction Worker /\nLabour'),
        Option(value: 'other', label: 'Other outdoor job'),
      ],
    ),


    Question(
      title: "How many hours\n",
      highlight: "do you work?",
      options: [
        Option(value: '1-4', label: '1 - 4 hours'),
        Option(value: '5-8', label: '5 - 8 hours'),
        Option(value: '8+', label: 'More than 8 hours'),
      ],
    ),
    
    Question(
      title: "How physically demanding \n",
      highlight: "is your work?",
      options: [
        Option(value: 'light', label: 'Light'),
        Option(value: 'medium', label: 'Medium'),
        Option(value: 'heavy', label: 'Heavy'),
      ],
    ),

    Question(
      title: "During which time \nof the day do you \n",
      highlight: "work the most?",
      options: [
        Option(value: 'morning', label: 'Morning (before 12 PM)'),
        Option(value: 'afternoon', label: 'Afternoon (12 PM – 5 PM) ← Highest heat danger'),
        Option(value: 'evening', label: 'Evening / Night (after 5 PM)'),
        Option(value: 'changes', label: 'My schedule changes every day'),
      ],
    ),

    Question(
      title: "How often do you\ndrink water while\n",
      highlight: "working?",
      options: [
        Option(value: 'morning', label: 'Rarely / I forget'),
        Option(value: 'afternoon', label: 'Once every 2–3 hours'),
        Option(value: 'evening', label: ' Every 1–2 hours'),
        Option(value: 'changes', label: 'Very often (I carry a bottle with me)'),
      ],
    ),

     Question(
      title: "What is your age \n",
      highlight: "group?",
      options: [
        Option(value: 'morning', label: 'Below 25'),
        Option(value: 'afternoon', label: '25 – 35'),
        Option(value: 'evening', label: ' 36 – 45'),
        Option(value: 'changes', label: 'Above 45'),
      ],
    ),

    Question(
      title: "Do you have any of\nthese health\n",
      highlight: "conditions?",
      options: [
        Option(value: 'morning', label: 'High Blood Pressure / Diabetes'),
        Option(value: 'afternoon', label: 'Heart-related issues'),
        Option(value: 'evening', label: 'Asthma / Breathing problems'),
        Option(value: 'changes', label: 'None'),
        Option(value: 'not', label: ' Prefer not to say'),
      ],
    ),

  ];

  Question get currentQuestion => questions[currentIndex];

  void selectOption(String value) {
    currentQuestion.selectedValue = value;
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
    }
  }

  void previousQuestion() {
  if (currentIndex > 0) {
    currentIndex--;
  }
}
}
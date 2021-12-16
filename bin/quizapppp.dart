import 'dart:io';

void main() {
  int score = 0;
  List<Question> questions = [
    Question(
        point: 10,
        question: "which color i like",
        answers: ['black', 'red', 'green']),
    Question(
        point: 30,
        question: "which numbers i prefer",
        answers: ["odd", "even"]),
    Question(
        point: 50,
        question: "which ice cream  i like",
        answers: ["chocolate", "vanilla"])
  ];

  for (Question question in questions) {
    print(question.question + "\n");
    for (int i = 0; i < questions.length; i++) {
      print("[${i + 1}] - ${question.answers[i]}");
    }
    String? choise = stdin.readLineSync();
    String userAnswer = question.answers[int.parse(choise!) - 1];
    if (userAnswer == question.rightAnswer) {
      score += question.point;

      print(
          'your answer is right and you get is ${question.point} and your score is$score');
    } else {
      score -= question.point;
      print(
          'your answer is wrong and we take ${question.point} and your score is$score');
    }
    print("thank you for playing and your score is$score");
  }
}

class Question {
  late int point;
  late String question;
  late List<String> answers;
  late String rightAnswer;
  Question(
      {required this.point, required this.question, required this.answers}) {
    rightAnswer = answers[0];
    answers.shuffle();
  }
}

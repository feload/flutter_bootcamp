import 'package:quizzler/question.dart';

class QuestionBrain {
  int qIdx;

  List<Question> questions = [
    Question(q: "q1 answer: true", a: true),
    Question(q: "q2 answer: false", a: false),
    Question(q: "q3 answer: false", a: false),
    Question(q: "q4 answer: true", a: true)
  ];

  QuestionBrain() {
    qIdx = 0;
  }

  void nextQuestion() {
    if (qIdx < questions.length - 1) qIdx++;
  }

  String getQuestionText() {
    return questions[qIdx].text;
  }

  bool getQuestionAnswer() {
    return questions[qIdx].answer;
  }

  bool assertQuestion(bool response) {
    return questions[qIdx].answer == response;
  }

  bool quizComplete(){
    return qIdx == questions.length - 1;
  }

  void reset() {
    qIdx = 0;
  }
}
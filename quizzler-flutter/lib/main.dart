import 'package:flutter/material.dart';
import 'package:quizzler/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int qIdx = 0;
  QuestionBrain brain = QuestionBrain();
  List<Icon> score = [];
  BuildContext ctx;

  void _showAlert() {
    Alert(
      context: ctx,
      type: AlertType.success,
      title: "Good Job!",
      desc: "You've finished",
      buttons: [
        DialogButton(
          child: Text(
            "Start again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(ctx);
            setState(() {
              brain.reset();
              score = [];
            });
          },
          width: 120,
        )
      ],
    ).show();
  }


  void checkAnswer(bool answer) {
    setState(() {
      if(brain.assertQuestion(answer)){
        score.add(Icon(Icons.check, color: Colors.green));
      }else{
        score.add(Icon(Icons.clear, color: Colors.red));
      }

      if (brain.quizComplete()) {
        _showAlert();
      }else{
        brain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}

/*

*/

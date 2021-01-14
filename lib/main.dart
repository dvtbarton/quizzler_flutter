import 'package:flutter/material.dart';
import 'quiz_bank.dart';

enum AnswerResult { RIGHT, WRONG }
QuizBank quizBank = new QuizBank();

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
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
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
                quizBank.getQuestion(),
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
                //The user picked true.
                setState(() {
                  checkAnswer(true);
                });
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
                //The user picked false.
                setState(() {
                  checkAnswer(false);
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }

  void checkAnswer(bool tfChoice) {
    if (tfChoice == quizBank.getAnswer()) {
      scoreKeeper.add(getIcon(AnswerResult.RIGHT));
    } else {
      scoreKeeper.add(getIcon(AnswerResult.WRONG));
    }

    if (!quizBank.nextQuestion()) {
      _showDialog(); // alert user the quiz is restarting
      scoreKeeper.clear(); // no more questions, so reset
    }
  }

  Icon getIcon(AnswerResult answerResult) {
    if (answerResult == AnswerResult.RIGHT) {
      return (const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      return (const Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  Future<void> _showDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No More Questions!'),
          content: Text("Start over!"),
          actions: [
            FlatButton(
              child: Text('Start over!'),
              onPressed: () => {Navigator.of(context).pop()},
            )
          ],
        );
      },
    );
  }
}

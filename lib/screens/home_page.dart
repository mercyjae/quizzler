import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();
  int score = 0;
  int questionNumber = 0;
  void checkAnswer(bool userAnswer,BuildContext ctx ) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (userAnswer == correctAnswer) {
        questionNumber++;
        final snackBar = SnackBar(
          content: Text('Correct answer!'),
          duration: const Duration(milliseconds: 500),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
        score++;
        lastQuestion();
      } else {
        final snackBar = SnackBar(
          content: Text('Wrong answer!'),
          duration: const Duration(milliseconds: 500),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
        questionNumber++;
        lastQuestion();
      }
      quizBrain.nextQuestion();
      // }
    });
  }
  void lastQuestion() {
    if (questionNumber == quizBrain.questionBank.length) {
      alert();
      setState(() {
        questionNumber = 0;
      });
    }
  }
  void alert() {
    Alert(
        context: context,
        title: " Finished",
        desc: "Your score is: $score/${quizBrain.questionBank.length}")
        .show();
    score = 0;
    quizBrain.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (ctx) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(TextSpan(
                        text: "Questions ${questionNumber + 1}/",
                        style: Theme.of(context).textTheme.headline4,
                        children: [
                          TextSpan(
                              text: "${quizBrain.questionBank.length}",
                              style: Theme.of(context).textTheme.headline5)
                        ])),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 100,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.yellow],
                        ),
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        quizBrain.getQuestion(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(20)),
                        onPressed: () {
                          checkAnswer(true,ctx);
                        },
                        child: Text(
                          "True",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(20)),
                        onPressed: () {
                          checkAnswer(false,ctx);
                        },
                        child: Text(
                          "False",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}

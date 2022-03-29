import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';
import 'package:quizzler/screens/splash_screen.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(debugShowCheckedModeBanner: false,
        home:SplashScreen());
  }
}

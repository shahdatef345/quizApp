import 'package:flutter/material.dart';
import 'pages/welcome_page.dart'; // Import WelcomePage
import 'pages/quiz_page.dart'; // Import QuizPage

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: WelcomePage(),
    );
  }
}

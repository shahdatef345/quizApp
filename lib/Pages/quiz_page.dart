import 'package:flutter/material.dart';
import 'Result_page.dart';

class QuizPage extends StatefulWidget {
  final String name;
  QuizPage({required this.name});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  List<Map<String, Object>> _questions = [
    {
      'question':
          'Which programming language is known as the backbone of web development?',
      'answers': ['Python', 'JavaScript', 'C++', 'Java'],
      'correctAnswer': 'JavaScript',
    },
    {
      'question': 'What does HTML stand for?',
      'answers': [
        'Hyper Text Markup Language',
        'High Text Machine Language',
        'Hyperlink and Text Markup Language',
        'Hyper Tool Markup Language'
      ],
      'correctAnswer': 'Hyper Text Markup Language',
    },
    {
      'question':
          'Which language is primarily used for Android app development?',
      'answers': ['Swift', 'Java', 'JavaScript', 'C#'],
      'correctAnswer': 'Java',
    },
  ];

  void _answerQuestion(String answer) {
    if (answer == _questions[_currentQuestionIndex]['correctAnswer']) {
      setState(() {
        _score++;
      });
    }

    if (_currentQuestionIndex == _questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(score: _score, name: widget.name),
        ),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex == _questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(score: _score, name: widget.name),
        ),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QUIZ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Ellipse 1.png',
                height: 150,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFA7F585),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${_currentQuestionIndex + 1}/${_questions.length}',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      _questions[_currentQuestionIndex]['question'] as String,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (_questions[_currentQuestionIndex]['answers']
                              as List<String>)
                          .map((answer) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _answerQuestion(answer),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                answer,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _nextQuestion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              _currentQuestionIndex == _questions.length - 1
                                  ? 'NEXT'
                                  : 'NEXT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

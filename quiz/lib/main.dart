import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/quesetion.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var b = Colors.black;
var w = Colors.white;
bool isSwitched = false;
int score = 0;
int _quesetionIndex = 0;
final _questions = [
  {
    'question': 'What is the capital of France?',
    'options': ['Paris', 'London', 'Berlin', 'Rome'],
    'answerIndex': 0,
  },
  {
    'question': 'Who painted the Mona Lisa?',
    'options': [
      'Leonardo da Vinci',
      'Pablo Picasso',
      'Vincent van Gogh',
      'Michelangelo'
    ],
    'answerIndex': 0,
  },
  {
    'question': 'Which planet is known as the "Red Planet"?',
    'options': ['Mars', 'Venus', 'Jupiter', 'Saturn'],
    'answerIndex': 0,
  },
  {
    'question': 'What is the largest ocean in the world?',
    'options': [
      'Pacific Ocean',
      'Atlantic Ocean',
      'Indian Ocean',
      'Arctic Ocean'
    ],
    'answerIndex': 0,
  },
  {
    'question': 'Who wrote the play "Romeo and Juliet"?',
    'options': [
      'William Shakespeare',
      'Jane Austen',
      'Charles Dickens',
      'Mark Twain'
    ],
    'answerIndex': 0,
  },
  {
    'question': 'What is the capital of Australia?',
    'options': ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
    'answerIndex': 2,
  },
  {
    'question': 'Who invented the telephone?',
    'options': [
      'Thomas Edison',
      'Alexander Graham Bell',
      'Nikola Tesla',
      'Albert Einstein'
    ],
    'answerIndex': 1,
  },
  {
    'question': 'Which country is famous for Mount Everest?',
    'options': ['Nepal', 'China', 'India', 'Tibet'],
    'answerIndex': 0,
  },
  {
    'question': 'What is the chemical symbol for gold?',
    'options': ['Go', 'Au', 'Ag', 'Gd'],
    'answerIndex': 1,
  },
  {
    'question': 'Who is the author of "To Kill a Mockingbird"?',
    'options': ['J.K. Rowling', 'Harper Lee', 'George Orwell', 'Mark Twain'],
    'answerIndex': 1,
  },
];

void AnswerQuestion(int x, BuildContext context) {
  if (_quesetionIndex < (_questions.length) - 1) {
    _quesetionIndex += 1;
  }

  debugPrint('Answer chosen!');
  debugPrint('Question: $_quesetionIndex');
  debugPrint('Score: $score');
  if (x == _questions[_quesetionIndex]['answerIndex']) {
    score++;
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Switch(
              activeColor: Colors.white,
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  if (isSwitched) {
                    b = Colors.white;
                    w = Colors.black;
                  } else {
                    b = Colors.black;
                    w = Colors.white;
                  }
                });
              },
            )
          ],
          title: Text(
            'Quiz',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: w,
          width: double.infinity,
          child: _quesetionIndex < _questions.length - 1
              ? Column(
                  children: [
                    Quesetion(
                      QuesetionText:
                          _questions[_quesetionIndex]['question'].toString(),
                      x: b,
                    ),
                    Answer(
                      answerText: List<String>.from(_questions[_quesetionIndex]
                              ['options'] as List<dynamic>)[0]
                          .toString(),
                      x: () {
                        setState(() {
                          AnswerQuestion(0, context);
                        });
                      },
                    ),
                    Answer(
                      answerText: List<String>.from(_questions[_quesetionIndex]
                              ['options'] as List<dynamic>)[1]
                          .toString(),
                      x: () {
                        setState(() {
                          AnswerQuestion(1, context);
                        });
                      },
                    ),
                    Answer(
                      answerText: List<String>.from(_questions[_quesetionIndex]
                              ['options'] as List<dynamic>)[2]
                          .toString(),
                      x: () {
                        setState(() {
                          AnswerQuestion(2, context);
                        });
                      },
                    ),
                    Answer(
                        answerText: List<String>.from(
                                _questions[_quesetionIndex]['options']
                                    as List<dynamic>)[3]
                            .toString(),
                        x: () {
                          setState(() {
                            AnswerQuestion(2, context);
                          });
                        }),
                  ],
                )
              : Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DONE!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Your score is $score',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _quesetionIndex = 0;
                                score = 0;
                              });
                            },
                            child: Text('restart the app'))
                      ],
                    ),
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                if (_quesetionIndex != 0) {
                  _quesetionIndex--;
                  score--;
                }
              });
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}

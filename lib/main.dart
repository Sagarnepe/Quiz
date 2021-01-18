import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionNumber = 0;
  int currentScore = 0;
  Questions questions = Questions();

  void updateQ(){
    setState(() {
      questionNumber = questionNumber + 1;
    });
  }

  bool checkQ(int questionNumber){
    return questionNumber < questions.questionBank.length ?true: false;
  }

  void updateScore(bool choice, int questionNumber){
    if(questions.questionBank.length == questionNumber) {
      print("End of the Questions");
    }else{
      if(questions.questionBank[questionNumber].answer == choice){
        setState(() {
          currentScore++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    checkQ(questionNumber)?questions.questionBank[questionNumber].questionText.toString(): " End ",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                SizedBox(height: 10.0,),
                ElevatedButton( onPressed:(){
                  setState((){
                    if(questions.questionBank.length == questionNumber) {
                      print("End of the Questions");
                    }else{
                      updateScore(true, questionNumber);
                      updateQ();
                    }

                  });
                },
                  child: Text('True', style: TextStyle(fontSize: 20.0),),),
                SizedBox(height: 10.0,),
                ElevatedButton( onPressed:(){
                  setState((){
                    if(questions.questionBank.length == questionNumber) {
                      print("End of the Questions");
                    }else{
                      updateScore(false, questionNumber);
                      updateQ();
                    }
                  });
                },
                  child: Text('False', style: TextStyle(fontSize: 20.0),),),
                SizedBox(height: 40.0,),
                Center(
                  child: Text(
                    "Current Score",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                SizedBox(height: 40.0,),
                Center(
                  child: Text(
                    '${currentScore}',
                    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
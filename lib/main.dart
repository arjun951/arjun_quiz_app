import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'oops.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  
  int _userScore = 0;

  Oops questionSet = Oops();

  void checkUserAns(bool userAns){
    if(userAns==questionSet.getQuestion().answer && questionSet.iconAllowed==true){
      _userScore++;
    }
  }
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,

                child: Center(
                  child: Text(
                    'YOUR SCORE : $_userScore',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                    child: Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        
                      ),
                      questionSet.getQuestion().question
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: CircularCountDownTimer(
                        width: 15,
                        height: 15,
                        duration: 5,
                        fillColor: Colors.white,
                        ringColor: Colors.pinkAccent,
                      controller: _controller,
                      onComplete: (){
                          setState(() {
                            if(questionSet.iconAllowed==true){
                              questionSet.nextQuestion();
                              _controller.restart();
                            }
                          });
                      },
                    ),
                  ),
              ),
              Expanded(
                flex: 1,
                child: Container(

                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    child: Text(
                        'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        checkUserAns(true);
                        questionSet.nextQuestion();
                        if(questionSet.iconAllowed==true){
                          _controller.restart();
                        }
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.green)
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextButton(
                    child: Text(
                        'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        checkUserAns(false);
                        questionSet.nextQuestion();
                        if(questionSet.iconAllowed==true){
                          _controller.restart();
                        }
                        else{
                          Alert(
                            context: context,
                            title: "RFLUTTER ALERT",
                            desc: "Flutter is more awesome with RFlutter Alert.",
                          ).show();
                        }
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

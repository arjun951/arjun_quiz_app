import 'question.dart';
class Oops{
  bool iconAllowed = true;
  List<Question> ques = [
    Question(ques: 'Animals are better than humans', ans: true),
    Question(ques: 'Love is rare to find', ans: true),
    Question(ques: 'Our generation of humans are the happiest', ans: false),
    Question(ques: 'Bount is fastest human on the planet', ans: true),
    Question(ques: 'Money can buy happiness', ans: true),
    Question(ques: 'Overthinking helps on overcoming stress', ans: false),
    Question(ques: 'No one loves the way you mom loves you', ans: true),
    Question(ques: 'Everyone can understand our feelings', ans: false),
    Question(ques: 'Honesty is the best policy', ans: false),
    Question(ques: 'Arijit Singh is better than Abhijeet Banerjee', ans: false),
    Question(ques: 'Insted of spending money on searching other habitable planet, we should spend to save our Earth', ans: true),
    Question(ques: 'We can always make everyone happy', ans: false)
  ];
  int _questionNumber = 0;
  Question getQuestion(){
    return ques[_questionNumber];
  }
  void nextQuestion(){
    if(_questionNumber<ques.length-1){
      _questionNumber++;
    }
    else{
      iconAllowed = false;
    }
  }
}
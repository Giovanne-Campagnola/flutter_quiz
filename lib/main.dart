import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/Question.dart';
import 'package:quiz/data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(home: const Quiz()));
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var question;
  var chosenQuestions = <Map<String, dynamic>>{};
  Key answerButtonKey = UniqueKey();
  bool alert = false;
  List<Icon> log = []; 

  @override
  void initState() {
    super.initState();
    var result = getQuestion(chosenQuestions);
    question = result['statement'];
    chosenQuestions = result['chosenQuestions'];
    HardwareKeyboard.instance.addHandler(_onKey);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_onKey);
    super.dispose();
  }
  bool _onKey(KeyEvent event) {
    if (event is KeyDownEvent) {
      if ((event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.space) && alert == false){
        newQuiz();
        return true;
      }
    }
    return false;
  }

  void newQuiz() {
    try {
      restartQuiz();
    } catch (e) {
      setState(() {
        alert = true;
        Alert(
          context: context,
          title: 'Fim do Quiz!',
          desc: 'Você respondeu a todas as perguntas.',
          style: AlertStyle(backgroundColor: Colors.white),
          closeFunction: (){
            Navigator.pop(context);
            log = [];
            chosenQuestions = <Map<String, dynamic>>{};
            restartQuiz();
            alert = false;
          },
          buttons: [
            DialogButton(
              child: Text(
                "Ok!",
              style: TextStyle(color: Colors.white, fontSize: 20)),
              width: 120,
              onPressed: (){
                Navigator.pop(context);
                log = [];
                chosenQuestions = <Map<String, dynamic>>{};
                restartQuiz();
                alert = false;
              },
            )
          ],
        ).show();
      });
    }
      answerButtonKey = UniqueKey();   
  }
  
  void restartQuiz(){
    setState(() {
      var result = getQuestion(chosenQuestions);
      question = result['statement'];
      chosenQuestions = result['chosenQuestions'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40),),
          backgroundColor: const Color.fromARGB(255, 43, 56, 63),
            actions: <Widget>[
            IconButton(
              icon: Icon(Icons.navigate_next,color: Colors.white,size: 50,),
              tooltip: 'Próximo',
              onPressed:()=>newQuiz(),
            ),
          ],
        ),
        body: Question(key:answerButtonKey,question: question['statement'], answer: question['answer'],
        log:log),
      ),
    );
  }
}
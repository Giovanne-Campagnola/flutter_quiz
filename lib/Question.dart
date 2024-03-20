import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quiz/AnswerButton.dart';

class Question extends StatefulWidget {
  final String question;
  final bool answer;
  final List<Icon> log;

  Question({
    Key? key,
    required this.question,
    required this.answer,
    required this.log,
  }):super(key:key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool answered = false;

  void selectedAnswer(){
    setState(() {
      answered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(this.widget.question,
                style: TextStyle(fontSize: 35),
              ),  
            )
          ),
          AnswerButton(text: 'Verdadeiro', value:true,answer: this.widget.answer,
            answered: answered,selectedAnswer: selectedAnswer,log: this.widget.log),
          AnswerButton(text: 'Falso',value:false,answer: this.widget.answer,
            answered: answered,selectedAnswer: selectedAnswer,log: this.widget.log),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(alignment: WrapAlignment.center,children: this.widget.log),
          )
        ],
      ),
    );
  }
}
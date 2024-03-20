import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  final String text;
  final bool value;
  final bool answer;
  final bool answered;
  final Function selectedAnswer;
  final List<Icon> log;

  AnswerButton({
    required this.text,
    required this.value,
    required this.answer,
    required this.answered,
    required this.selectedAnswer,
    required this.log,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color backgroundColor = const Color.fromARGB(255, 43, 56, 63);

  void validateAnswer(bool answer) {
    if (answer == this.widget.answer) {
      setState(() {
        backgroundColor = Colors.green;
      });
    } else {
      setState(() {
        backgroundColor = Colors.red;
      });
    }
    widget.selectedAnswer();
    addLog(this.widget.answer,answer);
  }

    void addLog(value,answer) {
    if (answer == value) {
      this.widget.log.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      this.widget.log.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100,vertical: 10),
          child: TextButton(
            child: Text(this.widget.text,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
            onPressed: widget.answered ? null : () => validateAnswer(widget.value),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))
            ),
          ),
        )
    );
  }
}
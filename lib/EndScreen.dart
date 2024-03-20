import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 56, 63),
      ),
      body: Center(
        child: Text(
          'Todas as perguntas foram respondidas!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  final String title;

  DummyPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A55F2), // Match AppBar color with HomePage
        title: Text(title),
      ),
      body: Center(
        child: Text(
          "This is the $title page.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

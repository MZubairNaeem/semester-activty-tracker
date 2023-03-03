import 'package:flutter/material.dart';

class Semester extends StatefulWidget {
  const Semester({Key? key}) : super(key: key);

  @override
  State<Semester> createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester'),
      ),body: Center(
      child: Text("semester"),
    ),
    );
  }
}

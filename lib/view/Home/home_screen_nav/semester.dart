import 'package:flutter/material.dart';
import 'package:semester_tracker/resource/colors.dart';

class Semester extends StatefulWidget {
  const Semester({Key? key}) : super(key: key);

  @override
  State<Semester> createState() => _SemesterState();
}

class _SemesterState extends State<Semester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors().secondaryColor,
        title: Text('Semester'),
      ),body: Center(
      child: Text("semester",style: TextStyle(color: AppColors().lightColor ),),
    ),
    );
  }
}

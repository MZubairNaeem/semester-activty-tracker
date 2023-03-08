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
        title: const Text('Semester'),
      ),
      body: Center(
        child: Text(
          "semester",
          style: TextStyle(color: AppColors().lightColor),
        ),
      ) ,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add Semester"),
        icon: const Icon(Icons.add_box),
        backgroundColor: AppColors().lightColor,
      ),
    );
  }
}

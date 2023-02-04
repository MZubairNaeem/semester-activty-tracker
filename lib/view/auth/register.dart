import 'package:flutter/material.dart';
import 'package:semester_tracker/resource/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors().primaryColor,
      ),
    );
  }
}

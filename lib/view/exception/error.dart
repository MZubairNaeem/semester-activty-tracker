import 'package:flutter/material.dart';
class ErrorScreen extends StatefulWidget {
  const ErrorScreen(Object e, StackTrace trace, {Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Network Error",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),);
  }
}

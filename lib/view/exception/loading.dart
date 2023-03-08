import 'package:flutter/material.dart';
import 'package:semester_tracker/resource/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors().gradiant1,),);
  }
}

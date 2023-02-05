import 'package:flutter/material.dart';

import '../resource/colors.dart';

class LongButton extends StatelessWidget {
  String nameButton;
  LongButton({Key? key, required this.nameButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.maxFinite,
          height: 55,
          decoration: BoxDecoration(
              color: AppColors().secondaryColor,
              borderRadius:
              const BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              nameButton,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors().greyText),
            ),
          ),
        ),
      ),
    );
  }
}

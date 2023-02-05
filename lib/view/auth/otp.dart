import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:semester_tracker/view/auth/sign_in.dart';

import '../../resource/colors.dart';
import '../../resource/strings.dart';
import '../../widget/heading32.dart';
import '../../widget/long_button.dart';

class OTPVerify extends StatefulWidget {
  const OTPVerify({Key? key}) : super(key: key);

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors().primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors().lightText),
          backgroundColor: AppColors().primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Heading(
                          text: Strings().otp,
                          fontWeight: FontWeight.bold,
                        ),
                        Heading(
                          text: Strings().wait,
                          fontWeight: FontWeight.normal,
                        ),
                        Heading(
                          text: Strings().time,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                    OtpTextField(
                      textStyle: TextStyle(color: AppColors().lightText),
                      numberOfFields: 5,
                      enabledBorderColor: AppColors().secondaryColor,
                      focusedBorderColor: AppColors().lightText,
                      borderColor: AppColors().lightText,
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        setState(() {

                        });
                      }, // end onSubmit
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Didn't receive OTP? ",
                          style: TextStyle(
                              color: AppColors().greyText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 600),
                                  child: const SignIn())),
                          child: Text(
                            "Send again.",
                            style: TextStyle(
                                color: AppColors().lightColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    LongButton(nameButton: 'Verify OTP')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

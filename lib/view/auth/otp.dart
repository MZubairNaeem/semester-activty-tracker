import 'package:flutter/material.dart';
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
                        Heading(text: Strings().otp, fontWeight: FontWeight.bold,),
                        Heading(text: Strings().wait, fontWeight: FontWeight.normal,),
                        Heading(text: Strings().time, fontWeight: FontWeight.normal,),
                      ],
                    ),
                    const SizedBox(height: 70),
                    TextField(
                      style: TextStyle(color: AppColors().lightText),
                      cursorColor: AppColors().lightColor,
                      cursorWidth: 5,
                      //cursorHeight: 25,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors().secondaryColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          hintText: 'Mobile number',
                          hintStyle: TextStyle(
                              color: AppColors().lightText, fontSize: 18)),
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
                          onTap: () =>
                              Navigator.push(
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

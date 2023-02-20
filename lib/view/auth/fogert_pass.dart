import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:semester_tracker/view/auth/sign_in.dart';

import '../../resource/colors.dart';
import '../../resource/strings.dart';
import '../../widget/heading_32.dart';
import '../../widget/long_button.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
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
                        Heading(text: Strings().itsOkay, fontWeight: FontWeight.bold,),
                        Heading(text: Strings().forgetPassword, fontWeight: FontWeight.normal,),
                        Heading(text: Strings().recoverIt, fontWeight: FontWeight.normal,),
                      ],
                    ),
                    const SizedBox(height: 70),
                    TextField(
                      style: TextStyle(color: AppColors().lightText),
                      cursorColor: AppColors().lightColor,
                      cursorWidth: 5,
                      //cursorHeight: 25,
                      //controller: number,
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
                          "You wanna give another try? ",
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
                            "Sign In.",
                            style: TextStyle(
                                color: AppColors().lightColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const LongButton(nameButton: 'Recover',onPressed: null,)
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

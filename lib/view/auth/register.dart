import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:semester_tracker/resource/colors.dart';
import 'package:semester_tracker/view/auth/sign_in.dart';
import 'package:semester_tracker/widget/heading32.dart';
import 'package:semester_tracker/widget/long_button.dart';

import '../../resource/strings.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController number = TextEditingController();
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
                        Heading(text: Strings().hello, fontWeight: FontWeight.bold,),
                        Heading(text: Strings().signUp, fontWeight: FontWeight.normal,),
                        Heading(text: Strings().like, fontWeight: FontWeight.normal,),
                      ],
                    ),
                    const SizedBox(height: 70),
                    TextField(
                      style: TextStyle(color: AppColors().lightText),
                      cursorColor: AppColors().lightColor,
                      cursorWidth: 5,
                      //cursorHeight: 25,
                      controller: number,
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

                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 30.0),
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: Container(
                //       width: double.maxFinite,
                //       height: 55,
                //       decoration: BoxDecoration(
                //           color: AppColors().secondaryColor,
                //           borderRadius:
                //           const BorderRadius.all(Radius.circular(10))),
                //       child: Center(
                //         child: Text(
                //           'Send OTP',
                //           style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //               color: AppColors().greyText),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an account? ",
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
                    LongButton(nameButton: 'Send OTP')
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

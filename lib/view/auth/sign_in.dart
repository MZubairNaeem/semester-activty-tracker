import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:semester_tracker/resource/colors.dart';
import 'package:semester_tracker/resource/strings.dart';
import 'package:semester_tracker/view/auth/fogertPass.dart';
import 'package:semester_tracker/view/auth/register.dart';
import 'package:semester_tracker/widget/heading32.dart';
import 'package:semester_tracker/widget/long_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Heading(text: Strings().welcome, fontWeight: FontWeight.bold,),
                      Heading(text: Strings().signIn,  fontWeight: FontWeight.normal,),
                      Heading(text: Strings().missed, fontWeight: FontWeight.normal,),
                    ],
                  ),
                  const SizedBox(height: 70),
                  Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: AppColors().lightText),
                        cursorColor: AppColors().lightColor,
                        cursorWidth: 5,
                        //cursorHeight: 25,
                        controller: mobileNumberController,
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
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        style: TextStyle(color: AppColors().lightText),
                        cursorColor: AppColors().lightColor,
                        cursorWidth: 5,
                        //cursorHeight: 25,
                        controller: passwordController,
                        obscureText: true,
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
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: AppColors().lightText, fontSize: 18)),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                duration: const Duration(milliseconds: 600),
                                child: const ForgetPass())),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0,right: 10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forget Password',style: TextStyle(
                              color: AppColors().lightText,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an account? ",
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
                                child: const Register())),
                        child: Text(
                          "Register.",
                          style: TextStyle(
                              color: AppColors().lightColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  LongButton(nameButton: 'Sign In')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

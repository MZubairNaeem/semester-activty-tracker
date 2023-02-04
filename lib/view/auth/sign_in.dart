import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semester_tracker/resource/colors.dart';
import 'package:semester_tracker/resource/strings.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          Strings().welcome,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: AppColors().lightText),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          Strings().signIn,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 32,
                              color: AppColors().lightText),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          Strings().missed,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 32,
                              color: AppColors().lightText),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors().secondaryColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintText: 'Mobile number',
                            hintStyle: TextStyle(
                                color: AppColors().lightText, fontSize: 18)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(color: AppColors().lightText, fontSize: 18)),
                      ),
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
                      Text(
                        "Register",
                        style: TextStyle(
                            color: AppColors().lightColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors().secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 120.0,right: 120,top: 20,bottom: 20),
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors().greyText),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

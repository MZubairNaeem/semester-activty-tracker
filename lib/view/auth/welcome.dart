import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:semester_tracker/resource/colors.dart';
import 'package:semester_tracker/resource/strings.dart';
import 'package:semester_tracker/view/auth/register.dart';
import 'package:semester_tracker/view/auth/sign_in.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/splash-icon.png'),
              Column(
                children: [
                  Text(
                    Strings().headingHalf1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                        color: AppColors().lightText),
                  ),
                  Text(
                    Strings().headingHalf2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                        color: AppColors().lightText),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    Strings().headingDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // height: 1.3,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: AppColors().greyText),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const Register())),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 40, right: 40, top: 20, bottom: 20),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const SignIn())),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: AppColors().secondaryColor),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 20, bottom: 20),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors().greyText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

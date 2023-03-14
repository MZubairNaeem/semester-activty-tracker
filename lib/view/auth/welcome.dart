import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:semester_tracker/resource/colors.dart';
import 'package:semester_tracker/resource/strings.dart';
import 'package:semester_tracker/view/auth/register.dart';
import 'package:semester_tracker/view/auth/sign_in.dart';

class Welcome extends ConsumerWidget{
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   // final data = ref.watch(fireBaseAuthProvider);
    // final _auth = ref.watch(authenticationProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      body: Padding(
        padding:  EdgeInsets.all(screenWidth * 0.1),
        child: SafeArea(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Image.asset(
                   width: screenWidth * 0.6,
                   height: screenHeight * 0.4,
                     'assets/splash-icon.png',
                 ),

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
                 SizedBox(
                  height: screenHeight * 0.05,
                ),
                Text(
                  Strings().headingDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // height: 1.3,
                      fontWeight: FontWeight.normal,
                      fontSize: screenHeight * 0.02,
                      color: AppColors().greyText),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
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
                        alignment: Alignment.center,
                        height: screenHeight * 0.075,
                        width: screenWidth * 0.32,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            color: Colors.white),
                        child:  const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                        alignment: Alignment.center,
                        height: screenHeight * 0.075,
                        width: screenWidth * 0.32,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: AppColors().secondaryColor),
                        child: Text(

                          'Sign In',

                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors().greyText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

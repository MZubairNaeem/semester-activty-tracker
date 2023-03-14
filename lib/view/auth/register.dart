import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:semester_tracker/controller/auth_method.dart';
import 'package:semester_tracker/resource/colors.dart';
import 'package:semester_tracker/view/auth/sign_in.dart';
import 'package:semester_tracker/widget/heading_32.dart';

import '../../resource/strings.dart';
import '../Home/home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final username = TextEditingController();
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  Future _delay() async{
    setState((){
      isLoading = false;
    });
  }

  signUp() async {
    setState(() {
      isLoading = true;
      Future.delayed(const Duration(seconds: 3), _delay);
    });
    var res = await Authentication().signUpWithEmailAndPassword(_email.text, _password.text, context);
    if(res != 'success'){
      setState(() {
        isLoading = true;
        Future.delayed(const Duration(seconds: 10), _delay);
      });
    }else{
      setState(() {
        isLoading = true;
        Future.delayed(const Duration(seconds: 10), _delay);
      });
      Fluttertoast.showToast(
          msg: "Sign up successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: AppColors().primaryColor,
          backgroundColor: AppColors().lightColor,
          fontSize: 16.0
      );
    }

  }
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _formKey,
        backgroundColor: AppColors().primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors().lightText),
          backgroundColor: AppColors().primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Center(
              child: Column(
                children: [
                  Heading(
                    text: Strings().hello,
                    fontWeight: FontWeight.bold,
                  ),
                  Heading(
                    text: Strings().signUp,
                    fontWeight: FontWeight.normal,
                  ),
                  Heading(
                    text: Strings().like,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    style: TextStyle(color: AppColors().lightText),
                    cursorColor: AppColors().lightColor,
                    cursorWidth: 5,
                    //cursorHeight: 25,
                    controller: username,
                    decoration: InputDecoration (
                      focusColor: AppColors().secondaryColor,
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
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            color: AppColors().lightText, fontSize: 18)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    style: TextStyle(color: AppColors().lightText),
                    cursorColor: AppColors().lightColor,
                    cursorWidth: 5,
                    //cursorHeight: 25,
                    controller: _email,
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
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            color: AppColors().lightText, fontSize: 18)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextFormField(
                    validator: (value){
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password should be at least 6 characters long';
                      }
                      return null;
                    },
                    obscureText: true,
                    style: TextStyle(color: AppColors().lightText),
                    cursorColor: AppColors().lightColor,
                    cursorWidth: 5,
                    //cursorHeight: 25,
                    controller: _password,
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

                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
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
                        onTap: () => Navigator.push(
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
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  GestureDetector(
                    onTap: ()  {
                      if (_formKey.currentState!.validate()) {
                        signUp();
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AppColors().secondaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: isLoading? Center(child: CircularProgressIndicator(
                        color: AppColors().greyText,
                      )):Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors().greyText),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

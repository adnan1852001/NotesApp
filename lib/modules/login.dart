// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/modules/Categories.dart';
import 'package:notes/modules/sign_up.dart';
import 'package:notes/shared/network/remote/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/DataBaseHelperSc.dart';
import '../models/Sign_up.dart';
import '../shared/network/remote/back_navigator.dart';
import '../shared/network/remote/final_navigator.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = DBHelperSc();
    String? newPassWord;
    String? newEmail;
    var controllerEmail = TextEditingController();
    var controllerPassWord = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, top: 140.0, right: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 9.0,
              ),
              const Text(
                'Login to start using app,',
                style: TextStyle(
                  color: Color(0xff716F87),
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 81.0,
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                      top: 27,
                      right: 20,
                      left: 20,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Color(0xff9391A4)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          maxLines: 1, // يسمح بعرض أكثر من سطر
                          controller: controllerEmail,
                          autofocus: false,
                          cursorColor: Colors.black,
                          cursorHeight: 25,
                          cursorRadius: const Radius.circular(25),
                          cursorWidth: 1,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            newEmail = controllerEmail.text;
                          },
                        ),
                        SizedBox(
                          height: 29.0,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Color(0xff9391A4)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          maxLines: 1, // يسمح بعرض أكثر من سطر
                          controller: controllerPassWord,
                          autofocus: false,
                          cursorColor: Colors.black,
                          cursorHeight: 25,
                          cursorRadius: const Radius.circular(25),
                          cursorWidth: 1,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (val) async {
                            List<SignUpClass> signUps = await db.getAllSignUp();
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            if (controllerEmail.text != '' &&
                                controllerPassWord.text != '') {
                              for (var signUp in signUps) {
                                if (controllerEmail.text == signUp.email &&
                                    controllerPassWord.text ==
                                        signUp.password) {
                                  prefs.setBool('login', true).then((value) {
                                    if (value) {
                                      PushAndRemove(context,
                                          nextScreen: const Categories());
                                    }
                                  });
                                } else {
                                  snackBar(
                                      context, "Verify the email and password");
                                }
                              }
                            } else {
                              if (controllerEmail.text != '') {
                                snackBar(context, "Enter the Email");
                              } else {
                                snackBar(context, "Enter the Password");
                              }
                            }
                          },
                          onChanged: (value) {
                            newPassWord = controllerPassWord.text;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6A90F2),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () async {
                      List<SignUpClass> signUps = await db.getAllSignUp();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      if (controllerEmail.text != '' &&
                          controllerPassWord.text != '') {
                        for (var signUp in signUps) {
                          if (controllerEmail.text == signUp.email &&
                              controllerPassWord.text == signUp.password) {
                            prefs.setBool('login', true).then((value) {
                              if (value) {
                                PushAndRemove(context,
                                    nextScreen: const Categories());
                              }
                            });
                          } else {
                            snackBar(context, "Verify the email and password");
                          }
                        }
                      } else {
                        if (controllerEmail.text != '') {
                          snackBar(context, "Enter the Email");
                        } else {
                          snackBar(context, "Enter the Password");
                        }
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      color: Color(0xff9391A4),
                      fontSize: 18.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      List<SignUpClass> signUps = await db.getAllSignUp();

                      for (var signUp in signUps) {
                        print('ID: ${signUp.id}');
                        print('First Name: ${signUp.firstName}');
                        print('Last Name: ${signUp.lastName}');
                        print('Email: ${signUp.email}');
                        print('Phone: ${signUp.phone}');
                        print('Password: ${signUp.password}');
                        print('--------------');
                      }
                      BackNavigator(context, nextScreen: const SignUp());
                    },
                    child: const Text(
                      'Sign up ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

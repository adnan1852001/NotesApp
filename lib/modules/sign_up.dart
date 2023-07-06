// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/DataBaseHelperSc.dart';
import '../models/Sign_up.dart';
import '../shared/network/remote/final_navigator.dart';
import '../shared/network/remote/snack_bar.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = DBHelperSc();
    String? newPassWord;
    String? newEmail;
    String? newLastName;
    String? newFirstName;
    String? newPhone;
    var controllerLastName = TextEditingController();
    var controllerFirstName = TextEditingController();
    var controllerEmail = TextEditingController();
    var controllerPassWord = TextEditingController();
    var controllerPhone = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, top: 15.0, right: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
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
                'Create an account',
                style: TextStyle(
                  color: Color(0xff716F87),
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 53.0,
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
                      bottom: 31,
                      top: 31,
                      right: 20,
                      left: 20,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'First name',
                            hintStyle: TextStyle(color: Color(0xff9391A4)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          maxLines: 1, // يسمح بعرض أكثر من سطر
                          controller: controllerFirstName,
                          autofocus: false,
                          cursorColor: Colors.black,
                          cursorHeight: 25,
                          cursorRadius: const Radius.circular(25),
                          cursorWidth: 1,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            newFirstName = controllerFirstName.text;
                          },
                        ),
                        const SizedBox(
                          height: 17.0,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Last name',
                            hintStyle: TextStyle(color: Color(0xff9391A4)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          maxLines: 1, // يسمح بعرض أكثر من سطر
                          controller: controllerLastName,
                          autofocus: false,
                          cursorColor: Colors.black,
                          cursorHeight: 25,
                          cursorRadius: const Radius.circular(25),
                          cursorWidth: 1,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            newLastName = controllerLastName.text;
                          },
                        ),
                        const SizedBox(
                          height: 17.0,
                        ),
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
                          height: 17.0,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Phone',
                            hintStyle: TextStyle(color: Color(0xff9391A4)),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          maxLines: 1, // يسمح بعرض أكثر من سطر
                          controller: controllerPhone,
                          autofocus: false,
                          cursorColor: Colors.black,
                          cursorHeight: 25,
                          cursorRadius: const Radius.circular(25),
                          cursorWidth: 1,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,

                          onChanged: (value) {
                            newPhone = controllerPhone.text;
                          },
                        ),
                        const SizedBox(
                          height: 17.0,
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

                            if (signUps.length < 1) {
                              if (controllerEmail.text != '' &&
                                  controllerPassWord.text != '' &&
                                  controllerLastName.text != '' &&
                                  controllerFirstName.text != '' &&
                                  controllerPhone.text != '') {
                                db.insertSignUp(
                                  SignUpClass(
                                    firstName: newFirstName,
                                    email: newEmail,
                                    password: newPassWord,
                                    phone: newPhone,
                                    lastName: newLastName,
                                  ),
                                );
                                PushAndRemove(context,
                                    nextScreen: const Login());
                              } else {
                                snackBar(context, "Enter the fields correctly");
                              }
                            } else {
                              snackBar(context,
                                  "An account has been created for this device, another account cannot be created");
                            }
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('signups', true).then((value) {
                              if (value) {
                                PushAndRemove(context,
                                    nextScreen: const Login());
                              }
                            });
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

                      if (signUps.length < 1) {
                        if (controllerEmail.text != '' &&
                            controllerPassWord.text != '' &&
                            controllerLastName.text != '' &&
                            controllerFirstName.text != '' &&
                            controllerPhone.text != '') {
                          db.insertSignUp(
                            SignUpClass(
                              firstName: newFirstName,
                              email: newEmail,
                              password: newPassWord,
                              phone: newPhone,
                              lastName: newLastName,
                            ),
                          );
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('signups', true).then((value) {
                            if (value) {
                              PushAndRemove(context, nextScreen: const Login());
                            }
                          });
                        } else {
                          snackBar(context, "Enter the fields correctly");
                        }
                      } else {
                        snackBar(context,
                            "An account has been created for this device, another account cannot be created");
                      }
                      // for (var signUp in signUps) {
                      //   print('ID: ${signUp.id}');
                      //   print('First Name: ${signUp.firstName}');
                      //   print('Last Name: ${signUp.lastName}');
                      //   print('Email: ${signUp.email}');
                      //   print('Phone: ${signUp.phone}');
                      //   print('Password: ${signUp.password}');
                      //   print('--------------');
                      // }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

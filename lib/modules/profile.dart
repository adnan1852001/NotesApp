import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../layout/provider/my_provider.dart';
import '../models/DataBaseHelperSc.dart';
import '../models/Sign_up.dart';
import '../shared/network/remote/snack_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = DBHelperSc();
    db.getAllSignUp().then((value) {
      Provider.of<MyProvider>(context, listen: false).setSignUps(value);
    });
    return Consumer<MyProvider>(builder: (context, value, child) {
      String? newFirstName;
      String? newLastName;
      String? newPhone;
      String? newEmail;

      var controllerFirstName =
          TextEditingController(text: value.signUps![0].firstName ?? '');
      var controllerLastName =
          TextEditingController(text: value.signUps![0].lastName ?? '');
      var controllerPhone =
          TextEditingController(text: value.signUps![0].phone ?? '');
      var controllerEmail =
          TextEditingController(text: value.signUps![0].email ?? '');

      int numDone = 0;
      for (int i = 0; i < value.tasks!.length; i++) {
        if (value.tasks![i].isComplete == true) {
          ++numDone;
        }
      }
      int numWaiting = value.tasks!.length - numDone;
      return Scaffold(
          backgroundColor: const Color(0xffE4E4E4),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const Text('Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                )),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          body: value.signUps != null
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 15,
                            top: 35,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 80,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xff6A90F2),
                                    radius: 27,
                                    child: Text(
                                      value.signUps![0].firstName!
                                              .substring(0, 1)
                                              .toUpperCase() ??
                                          '',
                                      style: const TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        '${value.signUps![0].firstName!} ${value.signUps![0].lastName!}' ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        value.signUps![0].email! ?? '',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0xffA5A5A5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xff6A90F2),
                                  ),
                                ),
                                height: 85,
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          child: Text(
                                            'Categories',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff6A90F2),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          child: Text(
                                            '${value.tasks!.length}',
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Color(0xffA5A5A5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xff6A90F2),
                                  ),
                                ),
                                height: 85,
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          child: Text(
                                            'Done Notes',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff6A90F2),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          child: Text(
                                            '$numDone',
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Color(0xffA5A5A5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xff6A90F2),
                                  ),
                                ),
                                height: 85,
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          child: Text(
                                            'Waiting Notes',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff6A90F2),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          child: Text(
                                            '$numWaiting',
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Color(0xffA5A5A5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
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
                                      hintText: 'First name',
                                      hintStyle:
                                          TextStyle(color: Color(0xff9391A4)),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
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
                                  TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'Last name',
                                      hintStyle:
                                          TextStyle(color: Color(0xff9391A4)),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
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
                                  TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'Phone',
                                      hintStyle:
                                          TextStyle(color: Color(0xff9391A4)),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                    ),
                                    maxLines: null, // يسمح بعرض أكثر من سطر
                                    controller: controllerPhone,
                                    autofocus: false,
                                    cursorColor: Colors.black,
                                    cursorHeight: 25,
                                    cursorRadius: const Radius.circular(25),
                                    cursorWidth: 1,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (value) {
                                      newPhone = controllerPhone.text;
                                    },
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                      hintStyle:
                                          TextStyle(color: Color(0xff9391A4)),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                    ),
                                    maxLines: null, // يسمح بعرض أكثر من سطر
                                    controller: controllerEmail,
                                    autofocus: false,
                                    cursorColor: Colors.black,
                                    cursorHeight: 25,
                                    cursorRadius: const Radius.circular(25),
                                    cursorWidth: 1,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    onSubmitted: (val) {
                                      if (controllerFirstName.text != '' &&
                                          controllerLastName.text != '' &&
                                          controllerPhone.text != '' &&
                                          controllerEmail.text != '') {
                                      } else {
                                        snackBar(context, "Enter the Data");
                                      }
                                    },
                                    onChanged: (value) {
                                      newEmail = controllerEmail.text;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff6A90F2),
                                  textStyle: const TextStyle(fontSize: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                                onPressed: () async {
                                  if (controllerFirstName.text != '' &&
                                      controllerLastName.text != '' &&
                                      controllerPhone.text != '' &&
                                      controllerEmail.text != '') {
                                    await db.updateSignUp(
                                      SignUpClass(
                                        firstName: newFirstName,
                                        lastName: newLastName,
                                        email: newEmail,
                                        phone: newPhone,
                                      ),
                                    );
                                  } else {
                                    snackBar(context, "Enter the Data");
                                  }
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ));
    });
  }
}

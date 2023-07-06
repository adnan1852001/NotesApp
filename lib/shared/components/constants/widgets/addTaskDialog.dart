import 'package:flutter/material.dart';

import '../../../../models/DataBaseHelper.dart';
import '../../../../models/Task.dart';
import '../../../network/remote/back_navigator.dart';
import '../../../network/remote/final_navigator.dart';
import '../../../network/remote/snack_bar.dart';

class AddTaskDialog extends StatelessWidget {
  AddTaskDialog({
    Key? key,
    required this.db,
    required this.screen,
    required this.finalPop,
  }) : super(key: key);

  final DBHelper db;
  final Widget screen;
  final bool finalPop;

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    String? newTaskShortD;
    String? newTaskDescription;
    var controllerTile = TextEditingController();
    var controllerShortD = TextEditingController();
    var controllerDescription = TextEditingController();
    return Dialog(
      backgroundColor: const Color(0xffE4E4E4),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 350,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create note…',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Note Tile',
                          hintStyle: TextStyle(color: Color(0xff9391A4)),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        maxLines: 1, // يسمح بعرض أكثر من سطر
                        controller: controllerTile,
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        cursorRadius: const Radius.circular(25),
                        cursorWidth: 1,
                        textAlign: TextAlign.start,

                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          newTaskTitle = controllerTile.text;
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Short Description',
                          hintStyle: TextStyle(color: Color(0xff9391A4)),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        maxLines: 1, // يسمح بعرض أكثر من سطر
                        controller: controllerShortD,
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        cursorRadius: const Radius.circular(25),
                        cursorWidth: 1,
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,

                        onChanged: (value) {
                          newTaskShortD = controllerShortD.text;
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(color: Color(0xff9391A4)),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        maxLines: null, // يسمح بعرض أكثر من سطر
                        controller: controllerDescription,
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        cursorRadius: const Radius.circular(25),
                        cursorWidth: 1,
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (val) {
                          if (controllerTile.text != '' &&
                              controllerDescription.text != '' &&
                              controllerShortD.text != '') {
                            db.insertTask(Task(
                                taskName: newTaskTitle,
                                shortDescription: newTaskShortD,
                                description: newTaskDescription,
                                isComplete: false));
                            if (finalPop == true) {
                              PushAndRemove(context, nextScreen: screen);
                            } else {
                              BackNavigator(context, nextScreen: screen);
                            }
                          } else {
                            (snackBar(context, "Enter the note"));
                          }
                        },

                        onChanged: (value) {
                          newTaskDescription = controllerDescription.text;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xff6A90F2),
                      ),
                      width: 313.0,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6A90F2),
                          textStyle: const TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          if (controllerTile.text != '' &&
                              controllerDescription.text != '' &&
                              controllerShortD.text != '') {
                            db.insertTask(
                              Task(
                                taskName: newTaskTitle,
                                shortDescription: newTaskShortD,
                                description: newTaskDescription,
                                isComplete: false,
                              ),
                            );
                            if (finalPop == true) {
                              PushAndRemove(context, nextScreen: screen);
                            } else {
                              BackNavigator(context, nextScreen: screen);
                            }
                          } else
                            (snackBar(context, "Enter the note"));
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

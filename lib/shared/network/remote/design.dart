import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../modules/login.dart';
import 'back_navigator.dart';
import 'final_navigator.dart';

Widget design(
  context, {
  required IconData icon,
  required String title,
  required String explain,
  required bool left,
  bool? alertDialog,
  Widget? nextScreen,
}) {
  return GestureDetector(
    onTap: () {
      if (alertDialog == false) {
        BackNavigator(context, nextScreen: nextScreen!);
      } else {
        Widget cancelButton = MaterialButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        );
        Widget continueButton = MaterialButton(
            child: Text("Yes"),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              prefs.setBool('login', false).then((value) {
                if (value) {
                  PushAndRemove(
                    context,
                    nextScreen: Login(),
                  );
                }
              });
            });

        AlertDialog alert = AlertDialog(
          title: Text("Logout?"),
          content: const Text("Are you want to Logout?"),
          actions: [
            cancelButton,
            continueButton,
          ],
        );

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 18, right: 17, bottom: 10),
      child: Stack(
        alignment: left == true ? Alignment.centerLeft : Alignment.centerRight,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 80,
            child: Row(
              children: [
                const SizedBox(width: 15.0),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Color(0xff6A90F2),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        explain,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Color(0xffA5A5A5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 50.0),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Colors.black,
                ),

                // SizedBox(width: 10.0),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 5,
            decoration: BoxDecoration(
              color: const Color(0xff6A90F2),
              borderRadius: left == true
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    )
                  : const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
            ),
          )
        ],
      ),
    ),
  );
}

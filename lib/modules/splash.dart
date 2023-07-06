// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/modules/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../layout/provider/my_provider.dart';
import '../models/DataBaseHelper.dart';
import '../shared/network/remote/final_navigator.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var db = DBHelper();
    db.getAllTasks().then((value) {
      Provider.of<MyProvider>(context, listen: false).setTasks(value);
      Timer(const Duration(seconds: 2), () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('splash', true).then((value) {
          if (value) {
            PushAndRemove(context, nextScreen: const Login());
          }
        });
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 120,
              width: 120,
              child: Image.asset('images/iconfinder_note_1296370.png'),
            ),
            const Text(
              'My Notes',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'For Organized Life',
              style: TextStyle(fontSize: 15.0, color: Color(0xff707070)),
            ),
            const Spacer(),
            const Text(
              'Android Course - Notes App V1.0',
              style: TextStyle(fontSize: 15.0, color: Color(0xff707070)),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}

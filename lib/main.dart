// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/modules/Categories.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layout/provider/my_provider.dart';
import 'models/DataBaseHelperSc.dart';
import 'models/Sign_up.dart';
import 'modules/login.dart';
import 'modules/sign_up.dart';
import 'modules/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var db = DBHelperSc();
  List<SignUpClass> signUps = await db.getAllSignUp();

  Widget wighet;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool splash = prefs.getBool('splash') ?? false;
  bool login = prefs.getBool('login') ?? false;
  bool signups = prefs.getBool('signups') ?? false;
  print(splash);
  print(login);
  print(signups);
  if (splash != false) {
    if (signUps == false) {
      wighet = const SignUp();
    } else {
      if (login == false) {
        wighet = const Login();
      } else {
        wighet = const Categories();
      }
    }
  } else {
    wighet = Splash();
  }
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return MyProvider();
    },
    child: MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
              statusBarColor: Color(0xff6A90F2)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: wighet,
    ),
  ));
}

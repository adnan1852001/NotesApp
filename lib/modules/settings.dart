import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/modules/profile.dart';

import '../shared/network/remote/design.dart';
import 'about_app.dart';
import 'about_course.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4E4E4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text('Settings',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            )),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          design(
            context,
            title: 'Language',
            explain: 'Selected language: EN',
            icon: Icons.language,
            left: true,
            alertDialog: false,
          ),
          design(context,
              title: 'Profile',
              explain: 'Update your data…',
              icon: Icons.person,
              left: false,
              nextScreen: const Profile(),
              alertDialog: false),
          design(context,
              title: 'About App',
              explain: 'What is notes app?',
              icon: Icons.perm_device_information,
              left: true,
              alertDialog: false,
              nextScreen: AboutApp()),
          design(context,
              title: 'About course',
              explain: 'Describe the course in brief',
              icon: Icons.info_outline_rounded,
              left: false,
              alertDialog: false,
              nextScreen: const AboutCourse()),
          design(context,
              title: 'Logout',
              explain: 'Waiting your return…',
              icon: Icons.power_settings_new,
              left: true,
              alertDialog: true),
        ],
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void PushAndRemove(
  context, {
  required Widget nextScreen,
}) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => nextScreen),
    (Route<dynamic> route) => false,
  );
}

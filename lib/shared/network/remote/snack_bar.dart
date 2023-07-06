import 'package:flutter/material.dart';

void snackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xff6A90F2),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Ok',
        onPressed: () {
          // Code to execute.
        },
      ),
      content: Text(text),
      duration: const Duration(milliseconds: 2000),
      width: 250.0, // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textField({
  int? maxLines,
  required String? hint,
  required String? newController,
  required var controller,
}) {
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xff9391A4)),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        maxLines: maxLines ?? null, // يسمح بعرض أكثر من سطر
        controller: controller,
        autofocus: true,
        cursorColor: Colors.black,
        cursorHeight: 25,
        cursorRadius: const Radius.circular(25),
        cursorWidth: 1,
        textAlign: TextAlign.start,
        onChanged: (value) {
          newController = controller.text;
        },
      ),
      const SizedBox(
        height: 19.0,
      ),
    ],
  );
}

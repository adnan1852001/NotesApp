// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../../models/DataBaseHelper.dart';
import '../../../../models/Task.dart';
import '../../../../modules/Categories.dart';
import '../../../network/remote/final_navigator.dart';
import '../../../network/remote/snack_bar.dart';

class EditTaskDialog extends StatefulWidget {
  const EditTaskDialog({
    Key? key,
    required this.db,
    this.title,
    this.sDescription,
    this.description,
  }) : super(key: key);

  final DBHelper db;
  final String? title;
  final String? sDescription;
  final String? description;

  @override
  _EditTaskDialogState createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late String newTaskTitle;
  late String newTaskShortD;
  late String newTaskDescription;
  late TextEditingController _titleController;
  late TextEditingController _shortDescriptionController;
  late TextEditingController _descriptionController;
  var db = DBHelper();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _shortDescriptionController =
        TextEditingController(text: widget.sDescription);
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _shortDescriptionController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateTask() async {
    newTaskTitle = _titleController.text;
    newTaskShortD = _shortDescriptionController.text;
    newTaskDescription = _descriptionController.text;

    if (newTaskTitle.isNotEmpty &&
        newTaskShortD.isNotEmpty &&
        newTaskDescription.isNotEmpty) {
      Task updatedTask = Task(
        taskName: newTaskTitle,
        shortDescription: newTaskShortD,
        description: newTaskDescription,
        isComplete: false,
      );

      await widget.db.updateTask(updatedTask);
      PushAndRemove(context, nextScreen: const Categories());
    } else {
      snackBar(context, "Please enter the note");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xffE4E4E4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
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
                    'Edit note...',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Note Title',
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(color: Color(0xff9391A4)),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        maxLines: 1,
                        controller: _titleController,
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        cursorRadius: const Radius.circular(25),
                        cursorWidth: 1,
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Short Description',
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(color: Color(0xff9391A4)),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        maxLines: 1,
                        controller: _shortDescriptionController,
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        cursorRadius: const Radius.circular(25),
                        cursorWidth: 1,
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(color: Color(0xff9391A4)),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        maxLines: null,
                        controller: _descriptionController,
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        cursorRadius: const Radius.circular(25),
                        cursorWidth: 1,
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (val) {
                          _updateTask;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xff6A90F2),
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
                        onPressed: _updateTask,
                        child: const Text(
                          "Save Edit",
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

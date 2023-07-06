import 'package:flutter/material.dart';

import '../../models/Sign_up.dart';
import '../../models/Task.dart';

class MyProvider extends ChangeNotifier {
  List<Task>? tasks;
  List<SignUpClass>? signUps;

  setTasks(tasks) {
    this.tasks = tasks;
    notifyListeners();
  }

  setSignUps(signUps) {
    this.signUps = signUps;
    notifyListeners();
  }
}

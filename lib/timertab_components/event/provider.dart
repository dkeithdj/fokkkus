import 'package:flutter/material.dart';

class SliderValuesProvider extends ChangeNotifier {
  int focusDuration = 10;
  int breakDuration = 5;
  String timerstate = "focus";

  void updateFocusDuration(int value) {
    focusDuration = value;
    notifyListeners();
  }

  void updateBreakDuration(int value) {
    breakDuration = value;
    notifyListeners();
  }

  void updateStatus(String value) {
    timerstate = value;
    notifyListeners();
  }
}

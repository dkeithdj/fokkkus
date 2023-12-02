import 'package:flutter/material.dart';

class SliderValuesProvider extends ChangeNotifier {
  double focusDuration = 10;
  double breakDuration = 5;
  double autoSessions = 1;

  void updateFocusDuration(double value) {
    focusDuration = value;
    notifyListeners();
  }

  void updateBreakDuration(double value) {
    breakDuration = value;
    notifyListeners();
  }

  void updateAutoSessions(double value) {
    autoSessions = value;
    notifyListeners();
  }
}

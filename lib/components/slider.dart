import 'package:flutter/material.dart';

class MaxValueSlider extends StatefulWidget {
  final double maxValue;
  final double minValue;
  final ValueChanged<double>? onValueChanged;
  const MaxValueSlider({
    super.key,
    required this.maxValue,
    required this.minValue,
    this.onValueChanged,
  });
  @override
  State<MaxValueSlider> createState() => _MaxValueSliderState();
}

class _MaxValueSliderState extends State<MaxValueSlider> {
  double _currentValue = 5;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentValue,
      onChanged: (value) {
        setState(() {
          _currentValue = value;
          widget.onValueChanged?.call(value);
        });
      },
      min: widget.minValue,
      max: widget.maxValue,
      divisions: 5.toInt(),
    );
  }
}

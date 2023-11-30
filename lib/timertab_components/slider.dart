import 'package:flutter/material.dart';

class SliderComponent extends StatefulWidget {
  final double currentVal;
  final double maxValue;
  final String title;
  final double minValue;
  final int divisions;
  final double customVariance;
  final ValueChanged<double>? onSliderChanged;

  const SliderComponent({
    Key? key,
    required this.maxValue,
    required this.title,
    required this.minValue,
    required this.divisions,
    required this.customVariance,
    this.onSliderChanged,
    required this.currentVal,
  }) : super(key: key);

  @override
  State<SliderComponent> createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentVal;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xFF2E232F),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              _currentValue.toString(),
              style: const TextStyle(
                color: Color(0xFF2E232F),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
        Slider(
          value: _currentValue,
          min: widget.minValue,
          max: widget.maxValue,
          divisions: widget.divisions,
          activeColor: const Color(0xFF745D79),
          inactiveColor: const Color(0xFFE8E3EB),
          onChanged: (value) {
            setState(() {
              _currentValue = ((value / widget.customVariance).round() *
                  widget.customVariance);
            });
            widget.onSliderChanged?.call(_currentValue);
          },
        ),
      ],
    );
  }
}

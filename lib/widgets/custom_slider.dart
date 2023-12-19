import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';

class CustomSlider extends StatelessWidget {
  final double minimumNumber;
  final double maximumNumber;
  final double value;
  final void Function(double val) onChangeFunction;
  const CustomSlider({
    super.key,
    required this.maximumNumber,
    required this.minimumNumber,
    required this.onChangeFunction,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: primaryColor,
      value: value,
      min: minimumNumber,
      max: maximumNumber,
      onChanged: onChangeFunction,
    );
  }
}

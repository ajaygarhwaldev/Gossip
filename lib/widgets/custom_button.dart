import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onClickFunction;
  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    required this.textColor,
    required this.onClickFunction,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(buttonColor),
      ),
      onPressed: onClickFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          buttonText,
          style: subheadingStyle.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

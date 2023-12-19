import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        buttonText,
        style: importantStyle.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

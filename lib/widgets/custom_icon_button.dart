import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';

class CustomIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final VoidCallback onClickFunction;
  const CustomIconButton({
    super.key,
    required this.buttonIcon,
    required this.onClickFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: appBarColor,
      ),
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          onPressed: onClickFunction,
          icon: Icon(
            buttonIcon,
            color: secondayColor,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isLast;
  final bool isFirst;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.isFirst,
    required this.isLast,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: secondayColor),
        ),
      ),
      child: TextField(
        controller: controller,
        style: importantStyle,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: appBarColor,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomLeft:
                  isLast ? const Radius.circular(30) : const Radius.circular(0),
              bottomRight:
                  isLast ? const Radius.circular(30) : const Radius.circular(0),
              topLeft: isFirst
                  ? const Radius.circular(30)
                  : const Radius.circular(0),
              topRight: isFirst
                  ? const Radius.circular(30)
                  : const Radius.circular(0),
            ),
          ),
        ),
      ),
    );
  }
}

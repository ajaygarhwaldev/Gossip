import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gossip/constants.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController barEditingController;
  final String hintText;
  final void Function(String) onChangeFunction;
  const CustomSearchBar({
    super.key,
    required this.barEditingController,
    required this.hintText,
    required this.onChangeFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChangeFunction,
      style: GoogleFonts.montserrat(
        color: Colors.black,
      ),
      controller: barEditingController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 0,
        ),
        fillColor: appBarColor,
        filled: true,
        hintText: "Search",
        hintStyle: GoogleFonts.montserrat(color: secondayColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

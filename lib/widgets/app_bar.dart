import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gossip/constants.dart';

class HomeAppBar extends StatelessWidget {
  final String appBarTitle;
  final VoidCallback onClick;
  const HomeAppBar({
    super.key,
    required this.appBarTitle,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        color: appBarColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onClick,
            child: Text(
              appBarTitle,
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

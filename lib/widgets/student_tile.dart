import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gossip/constants.dart';

class StudentTile extends StatelessWidget {
  final String username;
  final String imageLink;
  final double heightOfTile;
  final double widthOfTile;
  final bool usernameDisplay;
  const StudentTile({
    super.key,
    required this.imageLink,
    required this.username,
    required this.heightOfTile,
    required this.widthOfTile,
    required this.usernameDisplay,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: widthOfTile,
            height: heightOfTile,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(
                  imageLink,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                ),
              ),
            ),
          ),
          Visibility(
            visible: usernameDisplay,
            child: Positioned(
              bottom: 25,
              left: 25,
              child: Text(
                "@$username",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: secondayColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

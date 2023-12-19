import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/screens/chat_screen.dart';
import 'package:gossip/screens/home_screen.dart';
import 'package:gossip/screens/user_profile.dart';

class BottomBar extends StatelessWidget {
  final Color icon1;
  final Color icon2;
  final Color icon3;
  const BottomBar({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.icon3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: appBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
            child: Icon(
              FontAwesomeIcons.house,
              size: 25,
              color: icon1,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, ChatScreen.routeName);
            },
            child: Icon(
              FontAwesomeIcons.solidComment,
              size: 25,
              color: icon2,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, UserProfile.routeName);
            },
            child: Icon(
              FontAwesomeIcons.solidUser,
              size: 25,
              color: icon3,
            ),
          ),
        ],
      ),
    );
  }
}

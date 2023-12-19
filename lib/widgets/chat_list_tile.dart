import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gossip/constants.dart';

class ChatListTile extends StatelessWidget {
  final String imageLink;
  final String username;
  final String lastmsg;
  final bool isUnseen;
  final bool isLastTile;
  final bool isFirstTile;
  final VoidCallback onClickFunction;
  const ChatListTile({
    super.key,
    required this.imageLink,
    required this.isUnseen,
    required this.lastmsg,
    required this.username,
    required this.isFirstTile,
    required this.isLastTile,
    required this.onClickFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appBarColor,
        borderRadius: BorderRadius.only(
          bottomLeft:
              isLastTile ? const Radius.circular(30) : const Radius.circular(0),
          bottomRight:
              isLastTile ? const Radius.circular(30) : const Radius.circular(0),
          topLeft: isFirstTile
              ? const Radius.circular(30)
              : const Radius.circular(0),
          topRight: isFirstTile
              ? const Radius.circular(30)
              : const Radius.circular(0),
        ),
        border: const Border(
          bottom: BorderSide(
            width: 0.3,
            color: secondayColor,
          ),
        ),
      ),
      child: ListTile(
        onTap: onClickFunction,
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage(imageLink),
          radius: 25,
        ),
        trailing: const Icon(
          FontAwesomeIcons.solidCircle,
          size: 10,
          color: affectionColor,
        ),
        title: Text(
          username,
          style: importantStyle,
        ),
        subtitle: Text(
          lastmsg,
          style: subheadingStyle,
        ),
      ),
    );
  }
}

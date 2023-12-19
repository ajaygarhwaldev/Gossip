import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';

class SettingsTile extends StatelessWidget {
  final String tileText;
  final IconData tileIcon;
  final bool isLast;
  final bool isFirst;
  final VoidCallback onClickFunction;
  const SettingsTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.onClickFunction,
    required this.tileIcon,
    required this.tileText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appBarColor,
        borderRadius: BorderRadius.only(
          bottomLeft:
              isLast ? const Radius.circular(30) : const Radius.circular(0),
          bottomRight:
              isLast ? const Radius.circular(30) : const Radius.circular(0),
          topLeft:
              isFirst ? const Radius.circular(30) : const Radius.circular(0),
          topRight:
              isFirst ? const Radius.circular(30) : const Radius.circular(0),
        ),
        border: const Border(
          bottom: BorderSide(width: 0.5, color: secondayColor),
        ),
      ),
      child: ListTile(
        onTap: onClickFunction,
        leading: Icon(
          tileIcon,
          color: primaryColor,
          size: 23,
        ),
        title: Text(
          tileText,
          style: importantStyle,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';

class ProfileInformationTile extends StatelessWidget {
  final String subtitle;
  final String title;
  const ProfileInformationTile({
    super.key,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: appBarColor,
        border: Border(
          bottom: BorderSide(width: 0.5, color: secondayColor),
        ),
      ),
      child: ListTile(
        title: Text(title, style: importantStyle),
        subtitle: Text(subtitle, style: subheadingStyle),
      ),
    );
  }
}

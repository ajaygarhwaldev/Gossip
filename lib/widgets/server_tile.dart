import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';

class ServerTile extends StatelessWidget {
  final String serverName;
  final String participants;
  final double height;
  final double width;
  final String imageCode;
  const ServerTile({
    super.key,
    required this.participants,
    required this.serverName,
    required this.height,
    required this.width,
    required this.imageCode,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            image: DecorationImage(
              image: MemoryImage(
                base64Decode(imageCode),
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(serverName, style: subheadingStyle),
              const SizedBox(height: 1),
              Text("$participants participants", style: subheadingStyle),
            ],
          ),
        )
      ],
    );
  }
}

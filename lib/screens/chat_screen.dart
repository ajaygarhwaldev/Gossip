import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/info.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/bottom_navigation_bar.dart';
import 'package:gossip/widgets/chat_list_tile.dart';
import 'package:gossip/widgets/custom_search_bar.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = "/chatScreen";
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController searchBarController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: appBarColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 0),
        child: AppBar(),
      ),
      body: ListView(
        children: [
          HomeAppBar(appBarTitle: "Chat", onClick: () {}),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                CustomSearchBar(
                  barEditingController: searchBarController,
                  hintText: "Search",
                  onChangeFunction: (val) {},
                ),
                const SizedBox(height: 8),
                for (int i = 0; i < userInformation.length; i++)
                  ChatListTile(
                    imageLink: userInformation[i]["image"].toString(),
                    isUnseen: false,
                    lastmsg: userInformation[i]["lastmsg"].toString(),
                    username: userInformation[i]["username"].toString(),
                    isFirstTile: i == 0 ? true : false,
                    isLastTile: i == userInformation.length - 1 ? true : false,
                    onClickFunction: () {},
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(
        icon1: secondayColor,
        icon2: primaryColor,
        icon3: secondayColor,
      ),
    );
  }
}

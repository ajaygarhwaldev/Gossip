import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/info.dart';
import 'package:gossip/screens/server_creating_screen.dart';
import 'package:gossip/screens/server_joining_screen.dart';
import 'package:gossip/screens/settings_screen.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/custom_search_bar.dart';
import 'package:gossip/widgets/server_tile.dart';

class ServerList extends StatefulWidget {
  static String routeName = "/serverList";
  const ServerList({super.key});

  @override
  State<ServerList> createState() => _ServerListState();
}

class _ServerListState extends State<ServerList> {
  final TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 0),
        child: AppBar(),
      ),
      body: ListView(
        children: [
          HomeAppBar(
            appBarTitle: "Server List",
            onClick: () {},
          ),
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
                const SizedBox(height: 9),
                CustomButton(
                  buttonColor: secondayColor,
                  buttonText: "Create server",
                  textColor: primaryColor,
                  onClickFunction: () {
                    Navigator.pushNamed(
                      context,
                      ServerCreatingScreen.routeName,
                    );
                  },
                ),
                const SizedBox(height: 8),
                for (int i = 0; i < serverInfo.length; i++)
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ServerJoiningScreen.routeName,
                      );
                    },
                    child: ServerTile(
                      height: 250,
                      width: double.infinity,
                      participants: serverInfo[i]["participants"].toString(),
                      serverName: serverInfo[i]["name"].toString(),
                      imageLink: serverInfo[i]["logo"].toString(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, SettingScreen.routeName);
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 5,
        child: const Icon(
          FontAwesomeIcons.gear,
          color: secondayColor,
        ),
      ),
    );
  }
}

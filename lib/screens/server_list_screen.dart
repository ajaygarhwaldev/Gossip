import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/screens/server_creating_screen.dart';
import 'package:gossip/screens/settings_screen.dart';
import 'package:gossip/services/servers.dart';
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
  List displayingServerList = [];
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchBarController = TextEditingController();
  Server server = Server();

  Future<void> displayingSever(String text) async {
    var serverList = await server.fetchingServerList(text);
    setState(() {
      displayingServerList = serverList;
    });
  }

  @override
  void initState() {
    super.initState();
    displayingSever("");

    scrollController.addListener(scrollListen);
  }

  // Check Whether user has scrolled at the end or not
  void scrollListen() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print("Reached the end of the page!");
    }
  }

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
                  onChangeFunction: (val) async {
                    await displayingSever(searchBarController.text);
                  },
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
                for (int i = 0; i < displayingServerList.length; i++)
                  InkWell(
                    onTap: () {},
                    child: ServerTile(
                      height: 250,
                      width: double.infinity,
                      participants:
                          displayingServerList[i]["participants"].toString(),
                      serverName: displayingServerList[i]["name"],
                      imageCode: displayingServerList[i]["logo"],
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

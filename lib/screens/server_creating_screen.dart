import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/info.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/custom_text_field.dart';
import 'package:gossip/widgets/server_tile.dart';

class ServerCreatingScreen extends StatefulWidget {
  static String routeName = "/serverCreating";
  const ServerCreatingScreen({super.key});

  @override
  State<ServerCreatingScreen> createState() => _ServerCreatingScreenState();
}

class _ServerCreatingScreenState extends State<ServerCreatingScreen> {
  final TextEditingController serverNameController = TextEditingController();
  final TextEditingController serverPasswordController =
      TextEditingController();
  final TextEditingController adminPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    serverNameController.dispose();
  }

  @override
  void initState() {
    super.initState();
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
            appBarTitle: "Back",
            onClick: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ServerTile(
                  participants: "0",
                  serverName: serverNameController.text,
                  height: 250,
                  width: double.infinity,
                  imageLink: serverInfo[2]["logo"].toString(),
                ),
                const SizedBox(height: 1),
                CustomButton(
                  buttonColor: secondayColor,
                  buttonText: "Upload",
                  textColor: primaryColor,
                  onClickFunction: () {},
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: serverNameController,
                  isFirst: true,
                  isLast: false,
                  hintText: "Server Name here",
                ),
                CustomTextField(
                  controller: serverPasswordController,
                  isFirst: false,
                  isLast: false,
                  hintText: "Server Password here",
                ),
                CustomTextField(
                  controller: adminPasswordController,
                  isFirst: false,
                  isLast: true,
                  hintText: "Admin Password Here",
                ),
                const SizedBox(height: 8),
                CustomButton(
                  buttonColor: primaryColor,
                  buttonText: "Done",
                  textColor: secondayColor,
                  onClickFunction: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

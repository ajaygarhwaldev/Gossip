import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/screens/home_screen.dart';
import 'package:gossip/services/servers.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/custom_text_field.dart';
import 'package:gossip/widgets/server_tile.dart';

class ServerJoiningScreen extends StatefulWidget {
  const ServerJoiningScreen({
    super.key,
  });
  static String routeName = "/serverJoining";
  @override
  State<ServerJoiningScreen> createState() => _ServerJoiningScreenState();
}

class _ServerJoiningScreenState extends State<ServerJoiningScreen> {
  final TextEditingController passwordController = TextEditingController();
  final Server server = Server();
  late String serverName;
  late String participants;
  late String imageCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    serverName = args["serverName"];
    participants = args["participants"];
    imageCode = args["imageCode"];
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
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
                  participants: participants,
                  serverName: serverName,
                  height: 250,
                  width: double.infinity,
                  imageCode: imageCode,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: passwordController,
                  isFirst: true,
                  isLast: true,
                  hintText: "Server Password here",
                ),
                const SizedBox(height: 8),
                CustomButton(
                  buttonColor: primaryColor,
                  buttonText: "Join",
                  textColor: secondayColor,
                  onClickFunction: () async {
                    var joinedResponse = await server.joiningSever(
                      serverName,
                      passwordController.text,
                    );
                    if (joinedResponse) {
                      if (context.mounted) {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                          context,
                          HomeScreen.routeName,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

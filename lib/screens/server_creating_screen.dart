import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/screens/home_screen.dart';
import 'package:gossip/services/servers.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/custom_text_field.dart';
import 'package:gossip/widgets/server_tile.dart';
import 'package:image_picker/image_picker.dart';

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
  final Server server = Server();

  // Fetching server image from here
  dynamic serverImageCode;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      List<int> imageBytes = await pickedFile.readAsBytes();
      String base64 = base64Encode(Uint8List.fromList(imageBytes));

      setState(() {
        serverImageCode = base64;
      });
    }
  }

  // Usual functions here
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
                if (serverImageCode != null)
                  ServerTile(
                    participants: "0",
                    serverName: serverNameController.text,
                    height: 250,
                    width: double.infinity,
                    imageCode: serverImageCode,
                  ),
                const SizedBox(height: 1),
                CustomButton(
                  buttonColor: secondayColor,
                  buttonText: "Upload",
                  textColor: primaryColor,
                  onClickFunction: pickImage,
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
                  onClickFunction: () async {
                    var creationResponse = await server.creatingServer(
                      serverImageCode,
                      serverNameController.text,
                      serverPasswordController.text,
                      adminPasswordController.text,
                    );
                    // print(creationResponse["createdServer"]);
                    print(creationResponse["msg"]);
                    if (creationResponse["createdServer"] != null &&
                        creationResponse["createdServer"]) {
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
          ),
        ],
      ),
    );
  }
}

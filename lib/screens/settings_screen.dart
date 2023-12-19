import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gossip/info.dart';
import 'package:gossip/screens/change_password_screen.dart';
import 'package:gossip/screens/edit_profile_screen.dart';
import 'package:gossip/screens/server_list_screen.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/settings_tile.dart';

class SettingScreen extends StatefulWidget {
  static String routeName = "/settingsScreen";
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool userAdmin = true;

  @override
  void initState() {
    super.initState();
    userAdmin = studentProfileInfo["admin"] as bool;
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
                SettingsTile(
                  isFirst: true,
                  isLast: false,
                  tileIcon: FontAwesomeIcons.userPen,
                  onClickFunction: () {
                    Navigator.pushNamed(context, EditProfile.routeName);
                  },
                  tileText: "Edit Profile",
                ),
                SettingsTile(
                  isFirst: false,
                  isLast: false,
                  tileIcon: FontAwesomeIcons.key,
                  onClickFunction: () {
                    Navigator.pushNamed(context, ChangePassword.routeName);
                  },
                  tileText: "Change Password",
                ),
                SettingsTile(
                  isFirst: false,
                  isLast: false,
                  tileIcon: FontAwesomeIcons.circleInfo,
                  onClickFunction: () {},
                  tileText: "Help",
                ),
                SettingsTile(
                  isFirst: false,
                  isLast: false,
                  tileIcon: FontAwesomeIcons.book,
                  onClickFunction: () {},
                  tileText: "Terms and Conditions",
                ),
                SettingsTile(
                  isFirst: false,
                  isLast: false,
                  tileIcon: FontAwesomeIcons.circleHalfStroke,
                  onClickFunction: () {},
                  tileText: "Theme",
                ),
                SettingsTile(
                  isFirst: false,
                  isLast: false,
                  tileIcon: FontAwesomeIcons.trash,
                  onClickFunction: () {},
                  tileText: "Delete Profile",
                ),
                // Changes according to user type
                Visibility(
                  visible: userAdmin,
                  child: SettingsTile(
                    isFirst: false,
                    isLast: false,
                    tileIcon: FontAwesomeIcons.person,
                    onClickFunction: () {},
                    tileText: "Participants",
                  ),
                ),
                userAdmin
                    ? SettingsTile(
                        isFirst: false,
                        isLast: true,
                        onClickFunction: () {},
                        tileIcon: FontAwesomeIcons.server,
                        tileText: "Delete Server",
                      )
                    : SettingsTile(
                        isFirst: false,
                        isLast: true,
                        onClickFunction: () {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                            context,
                            ServerList.routeName,
                          );
                        },
                        tileIcon: FontAwesomeIcons.server,
                        tileText: "Leave Server",
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

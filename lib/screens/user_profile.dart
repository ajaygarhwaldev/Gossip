import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/info.dart';
import 'package:gossip/screens/settings_screen.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/big_avatar.dart';
import 'package:gossip/widgets/bottom_navigation_bar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/profile_information_tile.dart';

class UserProfile extends StatefulWidget {
  static String routeName = "/userProfile";
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
            appBarTitle: "Profile",
            onClick: () {},
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                const Avatar(
                  image:
                      "https://www.format.com/wp-content/uploads/portrait_of_black_man.jpg",
                ),
                ProfileInformationTile(
                  subtitle: "Name",
                  title: studentProfileInfo["name"].toString(),
                ),
                ProfileInformationTile(
                  subtitle: "Username",
                  title: studentProfileInfo["username"].toString(),
                ),
                ProfileInformationTile(
                  subtitle: "Bio",
                  title: studentProfileInfo["bio"].toString(),
                ),
                ProfileInformationTile(
                  subtitle: "Current Partner",
                  title: studentProfileInfo["currentPartner"].toString(),
                ),
                ProfileInformationTile(
                  subtitle: "Overall Rating",
                  title: studentProfileInfo["overallRating"].toString(),
                ),
                ProfileInformationTile(
                  subtitle: "Likes",
                  title: studentProfileInfo["likes"].toString(),
                ),
                ProfileInformationTile(
                  subtitle: "Hates",
                  title: studentProfileInfo["hates"].toString(),
                ),
                ProfileInformationTile(
                  subtitle: "Server",
                  title: studentProfileInfo["server"].toString(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      buttonColor: appBarColor,
                      buttonText: "Settings",
                      textColor: primaryColor,
                      onClickFunction: () {
                        Navigator.pushNamed(context, SettingScreen.routeName);
                      },
                    ),
                    const SizedBox(width: 16),
                    CustomButton(
                      buttonColor: primaryColor,
                      buttonText: "Logout",
                      textColor: secondayColor,
                      onClickFunction: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(
        icon1: secondayColor,
        icon2: secondayColor,
        icon3: primaryColor,
      ),
    );
  }
}

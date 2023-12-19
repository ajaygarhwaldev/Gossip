import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/info.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/big_avatar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/profile_information_tile.dart';

class StudentProfile extends StatefulWidget {
  static String routeName = "/studentProfile";
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
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
                const Avatar(
                  image:
                      "https://photographybydesiree.com/wp-content/uploads/2020/08/Innis1712-124.jpg",
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
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      buttonColor: appBarColor,
                      buttonText: "Hate",
                      textColor: primaryColor,
                      onClickFunction: () {},
                    ),
                    const SizedBox(width: 16),
                    CustomButton(
                      buttonColor: primaryColor,
                      buttonText: "Message",
                      textColor: secondayColor,
                      onClickFunction: () {},
                    ),
                    const SizedBox(width: 16),
                    CustomButton(
                      buttonColor: affectionColor,
                      buttonText: "Like",
                      textColor: appBarColor,
                      onClickFunction: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Visibility(
                  visible: studentProfileInfo["admin"] as bool,
                  child: Column(
                    children: [
                      CustomButton(
                        buttonColor: alertColor,
                        buttonText: "Make Admin",
                        textColor: appBarColor,
                        onClickFunction: () {},
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

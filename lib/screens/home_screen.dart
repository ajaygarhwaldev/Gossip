import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/info.dart';
import 'package:gossip/screens/student_profile.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/bottom_navigation_bar.dart';
import 'package:gossip/widgets/custom_icon_button.dart';
import 'package:gossip/widgets/custom_search_bar.dart';
import 'package:gossip/widgets/custom_slider.dart';
import 'package:gossip/widgets/student_tile.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchBarEditingController =
      TextEditingController();
  bool isFilterVisible = false;
  int likesValue = 0;
  int hatesValue = 0;
  int crushValue = 0;

  @override
  void dispose() {
    super.dispose();
    searchBarEditingController.dispose();
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
            appBarTitle: "Home",
            onClick: () {},
          ),
          const SizedBox(height: 8),
          // Search bar from here
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: CustomSearchBar(
                    barEditingController: searchBarEditingController,
                    hintText: "Search Bar",
                    onChangeFunction: (p0) {},
                  ),
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  buttonIcon: FontAwesomeIcons.sort,
                  onClickFunction: () {},
                ),
                const SizedBox(width: 8),
                CustomIconButton(
                  buttonIcon: FontAwesomeIcons.filter,
                  onClickFunction: () {
                    setState(() {
                      isFilterVisible = !isFilterVisible;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Filter bar from here
          Visibility(
            visible: isFilterVisible,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: const BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(likesValue.toString(), style: subheadingStyle),
                        Expanded(
                          child: CustomSlider(
                            maximumNumber: 100,
                            minimumNumber: 0,
                            onChangeFunction: (val) {
                              setState(() {
                                likesValue = val.toInt();
                              });
                            },
                            value: likesValue.toDouble(),
                          ),
                        ),
                        Text("Likes", style: subheadingStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Text(hatesValue.toString(), style: subheadingStyle),
                        Expanded(
                          child: CustomSlider(
                            maximumNumber: 100,
                            minimumNumber: 0,
                            onChangeFunction: (val) {
                              setState(() {
                                hatesValue = val.toInt();
                              });
                            },
                            value: hatesValue.toDouble(),
                          ),
                        ),
                        Text("Hates", style: subheadingStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Text(crushValue.toString(), style: subheadingStyle),
                        Expanded(
                          child: CustomSlider(
                            maximumNumber: 15,
                            minimumNumber: 0,
                            value: crushValue.toDouble(),
                            onChangeFunction: (val) {
                              setState(() {
                                crushValue = val.toInt();
                              });
                            },
                          ),
                        ),
                        Text("Crushes", style: subheadingStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Student Tiles from here
          const SizedBox(height: 8),
          for (int i = 0; i < userInformation.length; i++)
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StudentProfile.routeName,
                );
              },
              child: StudentTile(
                usernameDisplay: true,
                heightOfTile: 300,
                widthOfTile: double.infinity,
                imageLink: userInformation[i]["image"].toString(),
                username: userInformation[i]["username"].toString(),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomBar(
        icon1: primaryColor,
        icon2: secondayColor,
        icon3: secondayColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/custom_text_field.dart';
import 'package:gossip/widgets/student_tile.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  static String routeName = "/editProfile";
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController currentPartnerController =
      TextEditingController();
  final TextEditingController bioController = TextEditingController();

  // Image Picker Function here
  // Need to add special things for ios make sure to add them

  // Gotta complete this function here
  Future pickImage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    currentPartnerController.dispose();
    bioController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController.text = "Sid";
    currentPartnerController.text = "Shnaya";
    bioController.text = "This is a demo bio, I really hope that it works";
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                const SizedBox(height: 8),
                CustomTextField(
                  controller: nameController,
                  isFirst: true,
                  isLast: false,
                  hintText: "Please enter your name",
                ),
                CustomTextField(
                  controller: currentPartnerController,
                  isFirst: false,
                  isLast: false,
                  hintText: "You can enter your current partner here",
                ),
                CustomTextField(
                  controller: bioController,
                  isFirst: false,
                  isLast: true,
                  hintText: "You can enter your bio here",
                ),
                const SizedBox(height: 8),
                const StudentTile(
                  imageLink:
                      "https://i0.wp.com/pediaa.com/wp-content/uploads/2021/09/Portrait.jpg?fit=427%2C640&ssl=1",
                  username: "@username",
                  heightOfTile: 300,
                  widthOfTile: double.infinity,
                  usernameDisplay: false,
                ),
                CustomButton(
                  buttonColor: secondayColor,
                  buttonText: "Upload",
                  textColor: primaryColor,
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

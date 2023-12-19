import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/custom_text_field.dart';

class ChangePassword extends StatefulWidget {
  static String routeName = "/changePassword";
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    currentPasswordController.dispose();
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
                CustomTextField(
                  controller: currentPasswordController,
                  isFirst: true,
                  isLast: false,
                  hintText: "Current password",
                ),
                CustomTextField(
                  controller: newPasswordController,
                  isFirst: false,
                  isLast: false,
                  hintText: "New password",
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  isFirst: false,
                  isLast: true,
                  hintText: "Confirm new password",
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
          )
        ],
      ),
    );
  }
}

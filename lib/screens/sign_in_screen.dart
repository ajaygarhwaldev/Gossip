import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/screens/server_list_screen.dart';
import 'package:gossip/screens/sign_up_screen.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/custom_text_button.dart';
import 'package:gossip/widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/signIn";
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 0),
        child: AppBar(),
      ),
      body: Column(
        children: [
          HomeAppBar(
            appBarTitle: "Sign In",
            onClick: () {},
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: usernameController,
                    isFirst: true,
                    isLast: false,
                    hintText: "username",
                  ),
                  CustomTextField(
                    controller: passwordController,
                    isFirst: false,
                    isLast: true,
                    hintText: "password",
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    buttonColor: primaryColor,
                    buttonText: "Sign in",
                    textColor: secondayColor,
                    onClickFunction: () {
                      Navigator.pushReplacementNamed(
                        context,
                        ServerList.routeName,
                      );
                    },
                  ),
                  CustomTextButton(
                    buttonText: "Sign up",
                    onClick: () {
                      Navigator.pushReplacementNamed(
                        context,
                        SignUpScreen.routeName,
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

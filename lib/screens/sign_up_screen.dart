import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/screens/sign_in_screen.dart';
import 'package:gossip/services/auth.dart';
import 'package:gossip/widgets/app_bar.dart';
import 'package:gossip/widgets/custom_button.dart';
import 'package:gossip/widgets/custom_text_button.dart';
import 'package:gossip/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signUp";
  SignUpScreen({super.key});

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 0),
        child: AppBar(),
      ),
      body: Column(
        children: [
          HomeAppBar(appBarTitle: "Sign Up", onClick: () {}),
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
                    controller: emailController,
                    isFirst: false,
                    isLast: false,
                    hintText: "email",
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
                    buttonText: "Sign up",
                    textColor: secondayColor,
                    onClickFunction: () async {
                      var signedUpInfo = await auth.signUp(
                        usernameController.text,
                        emailController.text,
                        passwordController.text,
                      );
                      print(signedUpInfo["msg"]);
                      if (signedUpInfo["signedUp"]) {
                        if (context.mounted) {
                          Navigator.pushReplacementNamed(
                            context,
                            SignInScreen.routeName,
                          );
                        }
                      }
                    },
                  ),
                  CustomTextButton(
                    buttonText: "Sign in",
                    onClick: () {
                      Navigator.pushReplacementNamed(
                        context,
                        SignInScreen.routeName,
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

import 'package:flutter/material.dart';
import 'package:gossip/constants.dart';
import 'package:gossip/screens/change_password_screen.dart';
import 'package:gossip/screens/chat_screen.dart';
import 'package:gossip/screens/edit_profile_screen.dart';
import 'package:gossip/screens/home_screen.dart';
import 'package:gossip/screens/server_creating_screen.dart';
import 'package:gossip/screens/server_joining_screen.dart';
import 'package:gossip/screens/server_list_screen.dart';
import 'package:gossip/screens/settings_screen.dart';
import 'package:gossip/screens/sign_in_screen.dart';
import 'package:gossip/screens/sign_up_screen.dart';
import 'package:gossip/screens/student_profile.dart';
import 'package:gossip/screens/user_profile.dart';
import 'package:gossip/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String initialRoute = await Auth.verifyingToken();

  // Create a GlobalKey to obtain the context
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  runApp(
    GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping outside of the input field
        FocusScope.of(navigatorKey.currentContext!).unfocus();
      },
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: appBarColor,
          ),
        ),
        initialRoute: initialRoute,
        routes: {
          UserProfile.routeName: (context) => const UserProfile(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          StudentProfile.routeName: (context) => const StudentProfile(),
          ChatScreen.routeName: (context) => const ChatScreen(),
          SettingScreen.routeName: (context) => const SettingScreen(),
          EditProfile.routeName: (context) => const EditProfile(),
          ChangePassword.routeName: (context) => const ChangePassword(),
          ServerList.routeName: (context) => const ServerList(),
          ServerJoiningScreen.routeName: (context) =>
              const ServerJoiningScreen(),
          ServerCreatingScreen.routeName: (context) =>
              const ServerCreatingScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          SignInScreen.routeName: (context) => SignInScreen(),
        },
      ),
    ),
  );
}

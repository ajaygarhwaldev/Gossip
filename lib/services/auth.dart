import 'dart:convert';
import 'package:gossip/screens/home_screen.dart';
import 'package:gossip/screens/server_list_screen.dart';
import 'package:gossip/screens/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Future<dynamic> signUp(String username, String email, String password) async {
    String apiUrl = "http://192.168.1.2:3000/user/signup";
    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
        headers: {
          'Content-Type':
              'application/json', // Specify the content type as JSON
        },
      );
      var returnedMsg = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {"msg": returnedMsg["msg"], "signedUp": true};
      } else {
        return {"msg": returnedMsg["msg"], "signedUp": false};
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> signIn(String username, String password) async {
    String apiUrl = "http://192.168.1.2:3000/user/signin";
    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
        headers: {
          'Content-Type':
              'application/json', // Specify the content type as JSON
        },
      );
      var returnedMsg = jsonDecode(response.body);
      print(returnedMsg);
      if (response.statusCode == 200) {
        await saveToken(
          returnedMsg["token"],
          returnedMsg["userExist"]["_id"],
          returnedMsg["userExist"]["serverId"],
        );
        return {
          "msg": returnedMsg["msg"],
          "signedIn": true,
          "serverId": returnedMsg["serverId"]
        };
      } else {
        return {"msg": returnedMsg["msg"], "signedIn": false};
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> verifyingToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String? id = prefs.getString("id");
    String apiUrl = "http://192.168.1.2:3000/verify/token";
    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          "token": token,
          "id": id,
        }),
        headers: {
          'Content-Type':
              'application/json', // Specify the content type as JSON
        },
      );

      var returnedMsg = jsonDecode(response.body);
      if (returnedMsg["validUser"] && returnedMsg["serverId"].length != 0) {
        return HomeScreen.routeName;
      } else if (returnedMsg["validUser"]) {
        return ServerList.routeName;
      } else {
        return SignUpScreen.routeName;
      }
    } catch (e) {
      throw Exception("Server not working");
    }
  }

  Future<void> saveToken(String token, String id, String serverId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    await prefs.setString("id", id);
  }
}

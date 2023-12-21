import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Server {
  Future<dynamic> fetchingServerList(String searchText) async {
    String apiUrl = "http://192.168.1.2:3000/server";
    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({"text": searchText}),
        headers: {
          'Content-Type':
              'application/json', // Specify the content type as JSON
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> creatingServer(String serverImageCode, String serverName,
      String serverPassword, String adminPassword) async {
    final prefs = await SharedPreferences.getInstance();
    String apiUrl = "http://192.168.1.2:3000/server/create";
    try {
      String? id = await prefs.getString("id");
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type':
              'application/json', // Specify the content type as JSON
        },
        body: jsonEncode({
          "serverImageCode": serverImageCode,
          "serverName": serverName,
          "serverPassword": serverPassword,
          "adminPassword": adminPassword,
          "id": id,
        }),
      );

      var returndResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return returndResponse;
      } else {
        print("didn't work");
        return returndResponse;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> joiningSever(String serverName, String serverPassword) async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("id");
    String apiUrl = "http://192.168.1.2:3000/server/join";
    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          "serverName": serverName,
          "serverPassword": serverPassword,
          "userId": userId,
        }),
        headers: {
          'Content-Type':
              'application/json', // Specify the content type as JSON
        },
      );

      var returnedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("Joined");
        return returnedResponse["joined"];
      } else {
        print(returnedResponse["msg"]);
        return returnedResponse["joined"];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

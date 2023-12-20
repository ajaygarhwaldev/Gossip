import 'dart:convert';

import 'package:http/http.dart' as http;

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
}

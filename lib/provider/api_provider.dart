import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:swp391_auction_admin/models/respone/user_login_model.dart';
import 'package:http/http.dart' as http;
import 'package:swp391_auction_admin/router/router.dart';
import 'package:swp391_auction_admin/widget_tree.dart';

String baseUrl = 'https://reaauction.azurewebsites.net';

class ApiProvider {
  static Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {
      "content-type": "application/json",
      "accept": "application/json",
    };
    return header;
  }

  static Future<UserLoginModel?> logins(
      {required username, required String password}) async {
    UserLoginModel? userResponseModel;

    final url = Uri.parse('$baseUrl/v1/auction/auth/login');
    Map<String, String> header = await getHeader();
    try {
      final body = {
        'username': username,
        'password': password,
      };
      var response = await http.post(Uri.parse(url.toString()),
          headers: header, body: jsonEncode(body));
      print("TEST login: ${response.body}");
      if (response.statusCode == 200) {
        // Navigator.push(
        //   context as BuildContext,
        //   MaterialPageRoute(builder: (context) => WidgetTree()),
        // );
        var bodyConvert = jsonDecode(response.body);
        if (bodyConvert['isError'] == false) {
          router.go(RouteName.home);  
          return userResponseModel =
              UserLoginModel.fromMap(bodyConvert['result']);
        }
      }
    } catch (e) {
      print("Loi login: $e");
    }
    // userLoginResponseModel = UserLoginResponseModel(role: 1, accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6InRoYW5obGNoIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE2OTY4NDExNjAsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcwNDMiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo1MDAwIn0.o6AGUDUmxHmUxIwSkF0XNF1i83E60qAdyAx8Zq-3ENw");
    return userResponseModel;
  }
}

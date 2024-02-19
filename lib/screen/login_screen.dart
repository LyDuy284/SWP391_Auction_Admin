import 'package:flutter/material.dart';
import 'package:swp391_auction_admin/provider/api_provider.dart';
import 'package:swp391_auction_admin/widgets/login_field.dart';
import 'package:swp391_auction_admin/widgets/login_field_password.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final String adminUsername = "admin";
  final String adminPassword = "password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            LoginField(hintText: "username", controller: _usernameController),
            LoginFieldPassword(
                hintText: "password", controller: _passwordController),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      ApiProvider.logins(
                          username: username, password: password);
                    },
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

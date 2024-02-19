import 'package:flutter/material.dart';


class LoginFieldPassword extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const LoginFieldPassword({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        const Icon(Icons.lock, color: Color.fromARGB(255, 224, 48, 74)),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth * 0.25,
            ),
            child: TextFormField(
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 43, 42, 53),
                ),
                contentPadding: EdgeInsets.all(screenHeight * 0.025),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
              ),
              validator: (val) => val!.length < 6 ? 'Mật khẩu quá ngắn.' : null,
            ),
          ),
        ),
      ],
    );
  }
}
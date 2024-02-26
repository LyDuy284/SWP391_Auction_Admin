// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class TextHeader extends StatelessWidget {
  final String contentText;
  const TextHeader({
    Key? key,
    required this.contentText,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Text(
      contentText,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 28,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

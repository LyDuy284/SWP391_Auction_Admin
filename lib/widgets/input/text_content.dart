// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  final String contentText;
  final Color? color;
  final FontWeight? fontWeight;
  final int? fontSize;
  const TextContent({
    Key? key,
    required this.contentText,
    this.color,
    this.fontWeight,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      contentText,
      style: TextStyle(
        color: color ?? const Color.fromARGB(255, 255, 255, 255),
        fontSize: 15,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

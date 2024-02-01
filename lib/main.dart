import 'package:flutter/material.dart';
import 'package:swp391_auction_admin/constants.dart';
import 'package:swp391_auction_admin/widget_tree.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auction Estate Admin',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Constants.purpleDark,
          canvasColor: Constants.purpleLight),
      home: WidgetTree(),
    );
  }
}

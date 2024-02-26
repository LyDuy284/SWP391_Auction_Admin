import 'package:flutter/material.dart';
//import 'package:swp391_auction_admin/constants.dart';
import 'package:swp391_auction_admin/router/router.dart';
//import 'package:swp391_auction_admin/screen/login_screen.dart';
//import 'package:swp391_auction_admin/widget_tree.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueAccent,
      ),
      routerConfig: router,
    );
  }
}

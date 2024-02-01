import 'package:flutter/material.dart';
import 'package:swp391_auction_admin/page/drawer/drawer_page.dart';
import 'package:swp391_auction_admin/page/panel_center/panel_center_page.dart';
import 'package:swp391_auction_admin/page/panel_left/panel_left_page.dart';
import 'package:swp391_auction_admin/page/panel_right/panel_right_page.dart';
import 'package:swp391_auction_admin/page/widgets/app_bar_widget.dart';
import 'package:swp391_auction_admin/responsive_layout.dart';

class WidgetTree extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: (ResponsiveLayout.isTinyLimit(context) ||
                  ResponsiveLayout.isTinyHeightLimit(context)
              ? Container()
              : AppBarWidget()),
          preferredSize: Size(double.infinity, 100)),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: PanelCenterPage(),
        tablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(
              child: PanelCenterPage(),
            )
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(
              child: PanelRightPage(),
            )
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRightPage(),
            )
          ],
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}

import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:swp391_auction_admin/screen/login_screen.dart';
import 'package:swp391_auction_admin/widget_tree.dart';



class RouteName {
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';

  static const publicRoutes = [
    home,
    login,
  ];
}

//nếu không có path cụ thể thì trả về trang login
final router = GoRouter(
  redirect: (context, state) {
    if (RouteName.publicRoutes.contains(state.fullPath)) {
      return null;
    }
    return RouteName.login;
  },
  routes: [
    GoRoute(
      path: RouteName.home,
      builder: (context, state) => WidgetTree(),
    ),
    GoRoute(
      path: RouteName.login,
      builder: (context, state) => LoginPage(),
    ),
  ],
);

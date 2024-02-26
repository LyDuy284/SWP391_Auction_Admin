//import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:swp391_auction_admin/screen/login_screen.dart';
import 'package:swp391_auction_admin/screen/signup/sign_up_screen.dart';
import 'package:swp391_auction_admin/screen/user_profie_screen.dart';
import 'package:swp391_auction_admin/widget_tree.dart';

class RouteName {
  static const String home = '/home';
  static const String login = '/login';
  static const String users = '/users';
  static const String signup = '/users';

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
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: RouteName.users,
      builder: (context, state) => UserListProfile(),
    ),
    GoRoute(
      path: RouteName.signup,
     builder: (context, state) => const SignUpScreen(),
    ),
    //GoRoute(
    //  path: RouteName.profile,
    //  builder: (context, state) => const ProfileScreen(),
    //),
  ],
);

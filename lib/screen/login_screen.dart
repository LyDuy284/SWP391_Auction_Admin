import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:swp391_auction_admin/router/router.dart';
import 'package:swp391_auction_admin/screen/login/login_bloc.dart';
import 'package:swp391_auction_admin/screen/login/login_event.dart';
import 'package:http/http.dart' as http;
import 'package:swp391_auction_admin/screen/login/login_state.dart';
import 'package:swp391_auction_admin/screen/theme/pallete.dart';
import 'package:swp391_auction_admin/widgets/bar/top_bar.dart';
import 'package:swp391_auction_admin/widgets/input/text_content.dart';
import 'package:swp391_auction_admin/widgets/loading.dart';
import 'package:swp391_auction_admin/widgets/login_field.dart';
import 'package:swp391_auction_admin/widgets/login_field_password.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  bool checkLogin = false;
  final _bloc = LoginBloc();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc.add(CheckLoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
          bloc: _bloc,
          listener: (context, state) async {
            if (state is LoginLoading) {
              onLoading(context);
              return;
            } else if (state is LoginFirstState) {
              //chưa login
              Navigator.pop(context);
              checkLogin = true;
            } else if (state is LoginSuccessState) {
              if (state.userProfileModel.role == 3) {
                router.go(RouteName.home);
                toastification.show(
                    pauseOnHover: false,
                    progressBarTheme: const ProgressIndicatorThemeData(
                      color: Colors.green,
                    ),
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    foregroundColor: Colors.black,
                    context: context,
                    type: ToastificationType.success,
                    style: ToastificationStyle.minimal,
                    title: const TextContent(
                      contentText: "Đăng nhập thành công!",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    description: TextContent(
                      contentText:
                          "Chào mừng ${state.userProfileModel.firstName} ${state.userProfileModel.lastName}",
                      color: Colors.black,
                    ),
                    autoCloseDuration: const Duration(seconds: 2),
                    animationDuration: const Duration(milliseconds: 500),
                    alignment: Alignment.topRight);
                // showToast(
                //   context: context,
                //   colorText: Colors.white,
                //   msg:
                //       "Chào mừng ${state.userProfileModel.firstName} ${state.userProfileModel.lastName}",
                //   color: Pallete.successColor,
                //   icon:
                //       const Icon(Icons.waving_hand_sharp, color: Colors.white),
                //   top: 100,
                //   right: 650,
                // );
              } else {
                toastification.show(
                    pauseOnHover: false,
                    progressBarTheme: const ProgressIndicatorThemeData(
                      color: Colors.red,
                    ),
                    icon: const Icon(
                      Icons.error_outline_rounded,
                      color: Colors.red,
                    ),
                    foregroundColor: Colors.black,
                    context: context,
                    type: ToastificationType.error,
                    style: ToastificationStyle.minimal,
                    title: const TextContent(
                      contentText: "Lỗi đăng nhập!",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    description: const TextContent(
                      contentText: "Không có thẩm quyền",
                      color: Colors.black,
                    ),
                    autoCloseDuration: const Duration(seconds: 2),
                    animationDuration: const Duration(milliseconds: 500),
                    alignment: Alignment.topRight);
              }
            } else if (state is LoginFailure) {
              toastification.show(
                  pauseOnHover: false,
                  progressBarTheme: const ProgressIndicatorThemeData(
                    color: Colors.orange,
                  ),
                  icon: const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.orange,
                  ),
                  foregroundColor: Colors.black,
                  context: context,
                  type: ToastificationType.warning,
                  style: ToastificationStyle.minimal,
                  title: const TextContent(
                    contentText: "Lỗi đăng nhập!",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  description: const TextContent(
                    contentText: "Tài khoản hoặc mật khẩu không chính xác",
                    color: Colors.black,
                  ),
                  autoCloseDuration: const Duration(seconds: 2),
                  animationDuration: const Duration(milliseconds: 500),
                  alignment: Alignment.topRight);
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return checkLogin
                ? Stack(children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("assets/images/background_login.jpg"),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.1,
                            screenHeight * 0.1,
                            screenWidth * 0.1,
                            screenHeight * 0.1),
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.28,
                              child: Column(
                                children: [
                                  // Image.asset('assets/images/signin_balls.png'),
                                  const FittedBox(
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  LoginField(
                                    hintText: '',
                                    controller: usernameController,
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  LoginFieldPassword(
                                    hintText: '',
                                    controller: passwordController,
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  // const Padding(
                                  //   padding: EdgeInsets.only(left: 17),
                                  //   child: GradientButton(
                                  //     s: 'Đăng nhập',
                                  //     widthButton: 0.25,
                                  //   ),
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      String username = usernameController.text;
                                      String password = passwordController.text;
                                      _bloc.add(StartLoginEvent(
                                          username: username,
                                          password: password));
                                    },
                                    child: const Text(
                                      "Đăng nhập",
                                      style: TextStyle(
                                        color: Pallete.gradient3,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),                               
                                  SizedBox(
                                    width: screenWidth * 0.25,
                                    height: screenHeight * 0.04,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                    
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,                                
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.8,
                              // decoration: const BoxDecoration(
                              //   image: DecorationImage(
                              //     fit: BoxFit.scaleDown,
                              //     image: AssetImage("assets/images/background_login.jpg"),
                              //   ),
                              // ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ])
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 100, bottom: 50),
                          height: 100,
                          // child: Image.asset(
                          //   "assets/images/loading-71.gif",
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}

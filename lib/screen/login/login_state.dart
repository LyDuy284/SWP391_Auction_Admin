import 'package:equatable/equatable.dart';
import 'package:swp391_auction_admin/models/respone/user_login_model.dart';
import 'package:swp391_auction_admin/models/respone/user_profile_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

//Chưa đăng nhập
class LoginFirstState extends LoginState {}

class LoginSecondState extends LoginState {
  final UserProfileModel userProfileModel;
  const LoginSecondState({required this.userProfileModel});
  @override
  List<Object> get props => [userProfileModel];
}

class LoginSuccessState extends LoginState {
  final UserProfileModel userProfileModel;
  const LoginSuccessState({required this.userProfileModel});
  @override
  List<Object> get props => [UserLoginModel];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

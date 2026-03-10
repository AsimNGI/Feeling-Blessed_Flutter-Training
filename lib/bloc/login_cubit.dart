import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  UserModel? user;
  LoginCubit() : super(LoginInitial());
  void login() async {
    emit(LoginLoading());
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure());
    }
  }
}

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

class SignUpCubit extends Cubit<SignUpState> {
  UserModel? user;
  SignUpCubit() : super(SignUpInitial());
  void signUp() async {
    emit(SignUpLoading());
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure());
    }
  }
}

// Text(context.read<LoginCubit>().user?.email ?? 'No user');

class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {}

class UserModel {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String country;
  final String profilePicture;
  final String role;
  final String createdAt;
  final String updatedAt;
  final String token;
  final String refreshToken;
  final String tokenExpiration;
  final String refreshTokenExpiration;
  final String tokenType;
  final String tokenScope;
  final String tokenIssuer;
  final String tokenAudience;
  final String tokenSubject;
  UserModel({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.profilePicture,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
    required this.refreshToken,
    required this.tokenExpiration,
    required this.refreshTokenExpiration,
    required this.tokenType,
    required this.tokenScope,
    required this.tokenIssuer,
    required this.tokenAudience,
    required this.tokenSubject,
  });
}

import 'package:flutter/material.dart';

abstract class LoginScreenEvent {}

class LoginEvent extends LoginScreenEvent {
  final String? userName;
  final String? password;
  BuildContext context;

  LoginEvent({this.userName, this.password, required this.context});
}

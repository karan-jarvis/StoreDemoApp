import 'package:flutter/material.dart';

abstract class SignUpScreenEvent {}

class SignUpEvent extends SignUpScreenEvent {
  final String? userName;
  final String? email;
  final String? password;
  BuildContext context;

  SignUpEvent({
    this.userName,
    this.email,
    this.password,
    required this.context,
  });
}

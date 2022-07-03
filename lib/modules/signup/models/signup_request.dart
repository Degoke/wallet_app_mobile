import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignupRequest extends Equatable {
  final String first_name;
  final String last_name;
  final String email;
  final String password;

  SignupRequest(
      {required this.first_name,
      required this.last_name,
      required this.email,
      required this.password});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [first_name, last_name, email, password];

  Map<String, dynamic> toMap() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
    };
  }

  factory SignupRequest.fromMap(Map<String, dynamic> map) {
    return SignupRequest(
        first_name: map['first_name'],
        last_name: map['last_name'],
        email: map['email'],
        password: map['password']);
  }

  String toJson() => json.encode(toMap());

  factory SignupRequest.fromJson(String source) =>
      SignupRequest.fromMap(json.decode(source));
}

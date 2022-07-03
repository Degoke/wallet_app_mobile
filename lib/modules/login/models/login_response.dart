import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:wallet_app/common/models/user.dart';

class LoginResponse extends Equatable {
  final String status;
  final LoginResponseData data;

  LoginResponse({required this.status, required this.data});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, data];

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': data.toMap(),
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
        status: map['status'], data: LoginResponseData.fromMap(map['data']));
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));
}

class LoginResponseData extends Equatable {
  final String access;
  final String refresh;
  final User user;

  LoginResponseData({required this.access, required this.refresh, required this.user});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [access, refresh, user];

  Map<String, dynamic> toMap() {
    return {
      'access': access,
      'refresh': refresh,
      'user': user.toMap(),
    };
  }

  factory LoginResponseData.fromMap(Map<String, dynamic> map) {
    return LoginResponseData(
        access: map['access'], refresh: map['refresh'], user: User.fromMap(map['user']));
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseData.fromJson(String source) =>
      LoginResponseData.fromMap(json.decode(source));
}

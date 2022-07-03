import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:wallet_app/common/models/user.dart';

class SignupResponse extends Equatable {
  final String status;
  final User data;

  SignupResponse({required this.status, required this.data});

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

  factory SignupResponse.fromMap(Map<String, dynamic> map) {
    return SignupResponse(
        status: map['status'], data: User.fromMap(map['data']));
  }

  String toJson() => json.encode(toMap());

  factory SignupResponse.fromJson(String source) =>
      SignupResponse.fromMap(json.decode(source));
}

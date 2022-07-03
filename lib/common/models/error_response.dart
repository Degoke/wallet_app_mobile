import 'dart:convert';

import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable {
  final String status;
  final String message;

  ErrorResponse({required this.status, required this.message});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, message];

  Map<String, dynamic> toMap() {
    return {'status': status, 'message': message};
  }

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(status: map['status'], message: map['message']);
  }

  String toJson() => json.encode(toMap());

  factory ErrorResponse.fromJson(String source) =>
      ErrorResponse.fromMap(json.decode(source));
}

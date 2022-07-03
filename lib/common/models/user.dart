import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String first_name;
  final String last_name;

  User({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [id, email, first_name, last_name];
  }

  User copyWith({
    String? id,
    String? email,
    String? first_name,
    String? last_name,
  }) {
    return User(
        id: id ?? this.id,
        first_name: first_name ?? this.first_name,
        last_name: last_name ?? this.last_name,
        email: email ?? this.email);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'last_name': last_name,
      'first_name': first_name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        email: map['email'],
        first_name: map['first_name'],
        last_name: map['last_name']);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

// Generated by Dart Safe Data Class Generator. * Change this header on extension settings *
// ignore_for_file: type=lint
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class RegisterUserDto {
  const RegisterUserDto({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  RegisterUserDto copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return RegisterUserDto(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterUserDto.fromMap(Map<String, dynamic> map) {
    T cast<T>(String k) => map[k] is T
        ? map[k] as T
        : throw ArgumentError.value(map[k], k, '$T ← ${map[k].runtimeType}');
    return RegisterUserDto(
      name: cast<String>('name'),
      email: cast<String>('email'),
      password: cast<String>('password'),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserDto.fromJson(String source) =>
      RegisterUserDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RegisterUserDto(name: $name, email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterUserDto &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode;
}

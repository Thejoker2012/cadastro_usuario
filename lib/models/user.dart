import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String dataNascimento;

  const User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.dataNascimento,
  });

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['_id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      dataNascimento: map['dataNascimento'],
    );
  }
}

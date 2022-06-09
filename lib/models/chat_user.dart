// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChatUser extends Equatable {
  final String? uid;
  final String status;
  final String? name;
  final String? phone;
  final String? email;
  final String? photo;

  const ChatUser({
    this.uid,
    required this.status,
    this.name,
    this.phone,
    this.email,
    this.photo,
  });

  @override
  List<Object?> get props {
    return [
      uid,
      status,
      name,
      phone,
      email,
      photo,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'status': status,
      'name': name,
      'phone': phone,
      'email': email,
      'photo': photo,
    };
  }

  factory ChatUser.fromMap(Map<String, dynamic> map) {
    return ChatUser(
      uid: map['uid'] != null ? map['uid'] as String : null,
      status: map['status'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatUser.fromJson(String source) =>
      ChatUser.fromMap(json.decode(source) as Map<String, dynamic>);
}

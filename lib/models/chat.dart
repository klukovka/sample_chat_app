// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:sample_chat_app/models/message.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat extends Equatable {
  final String? uid;
  final Message? lastMessage;
  final String? name;
  final String? owner;
  final String? photo;
  final List<String> users;

  const Chat({
    required this.users,
    this.uid,
    this.lastMessage,
    this.name,
    this.owner,
    this.photo,
  });

  const Chat.empty()
      : users = const [],
        uid = null,
        lastMessage = null,
        name = null,
        owner = null,
        photo = null;

  factory Chat.fromJson(Map<String, dynamic> json) {
    return _$ChatFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatToJson(this);

  @override
  List<Object?> get props {
    return [
      uid,
      lastMessage,
      name,
      owner,
      photo,
      users,
    ];
  }
}

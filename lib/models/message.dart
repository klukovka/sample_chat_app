// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sample_chat_app/utils/extensions/date_time_ext.dart';

import 'chat_user.dart';

part 'message.g.dart';

@JsonSerializable()
class Message extends Equatable {
  final String uid;
  final String text;
  @JsonKey(
    toJson: DateTimeExt.toJson,
    fromJson: DateTimeExt.fromJson,
  )
  final DateTime createdAt;
  final String userId;
  final String chatId;
  final ChatUser? user;

  const Message({
    required this.text,
    required this.createdAt,
    required this.userId,
    required this.chatId,
    required this.uid,
    this.user,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return _$MessageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  List<Object?> get props => [
        uid,
        text,
        createdAt,
        user,
        userId,
        chatId,
      ];
}

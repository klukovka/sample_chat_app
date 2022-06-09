// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      text: json['text'] as String,
      createdAt: json['createdAt'] as String,
      userId: json['userId'] as String,
      chatId: json['chatId'] as String,
      uid: json['uid'] as String?,
      user: json['user'] == null
          ? null
          : ChatUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'uid': instance.uid,
      'text': instance.text,
      'createdAt': instance.createdAt,
      'userId': instance.userId,
      'chatId': instance.chatId,
      'user': instance.user,
    };

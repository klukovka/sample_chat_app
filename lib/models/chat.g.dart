// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      uid: json['uid'] as String?,
      lastMessage: json['lastMessage'] == null
          ? null
          : Message.fromJson(json['lastMessage'] as Map<String, dynamic>),
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'uid': instance.uid,
      'lastMessage': instance.lastMessage,
      'name': instance.name,
      'owner': instance.owner,
      'photo': instance.photo,
      'users': instance.users,
    };

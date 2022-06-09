import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_user.g.dart';

@JsonSerializable()
class ChatUser extends Equatable {
  final String? uid;
  final String status;
  final String? name;
  final String? phone;
  final String? email;
  final String? photo;

  const ChatUser({
    required this.status,
    this.uid,
    this.name,
    this.phone,
    this.email,
    this.photo,
  });

  const ChatUser.empty()
      : status = '',
        uid = null,
        name = null,
        phone = null,
        email = null,
        photo = null;

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return _$ChatUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatUserToJson(this);

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
}

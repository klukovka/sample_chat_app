part of 'chat_page_cubit.dart';

enum ChatPageStatus {
  loading,
  success,
  error,
}

class ChatPageState extends Equatable {
  final ChatPageStatus status;
  final Chat chat;
  final ChatUser user;
  final List<Message> messages;
  final String errorMessage;

  const ChatPageState({
    this.status = ChatPageStatus.loading,
    this.chat = const Chat.empty(),
    this.user = const ChatUser.empty(),
    this.messages = const [],
    this.errorMessage = '',
  });

  ChatPageState copyWith({
    ChatPageStatus? status,
    Chat? chat,
    ChatUser? user,
    List<Message>? messages,
    String? errorMessage,
  }) {
    return ChatPageState(
      status: status ?? this.status,
      chat: chat ?? this.chat,
      user: user ?? this.user,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      chat,
      user,
      messages,
      errorMessage,
    ];
  }
}

part of 'messaging_bloc.dart';

abstract class MessagingEvent extends Equatable {
  const MessagingEvent();

  @override
  List<Object?> get props => [];
}

class LoadMessagesEvent extends MessagingEvent {
  final String chatId;

  const LoadMessagesEvent(this.chatId);

  @override
  List<Object?> get props => [chatId];
}

class SendMessageEvent extends MessagingEvent {
  final Message message;

  const SendMessageEvent(this.message);

  @override
  List<Object?> get props => [message];
}
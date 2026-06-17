import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lance_it/features/shared/domain/entities/message.dart';
import 'package:lance_it/features/shared/domain/usecases/get_messages.dart';
import 'package:lance_it/features/shared/domain/usecases/send_message.dart';

part 'messaging_event.dart';
part 'messaging_state.dart';

class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
  final GetMessages getMessages;
  final SendMessage sendMessage;

  MessagingBloc({
    required this.getMessages,
    required this.sendMessage,
  }) : super(MessagingInitial());

  @override
  Stream<MessagingState> mapEventToState(MessagingEvent event) async* {
    if (event is LoadMessagesEvent) {
      yield MessagingLoading();
      final messagesResult = await getMessages(event.chatId);
      yield messagesResult.fold(
        (failure) => MessagingError('Failed to load messages'),
        (messages) => MessagingLoaded(messages),
      );
    } else if (event is SendMessageEvent) {
      yield MessagingSending();
      final sendResult = await sendMessage(event.message);
      yield sendResult.fold(
        (failure) => MessagingError('Failed to send message'),
        (_) => MessagingSent(),
      );
    }
  }
}
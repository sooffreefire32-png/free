import 'package:flutter/foundation.dart';
import 'package:lance_it/features/shared/data/models/message_model.dart';

class MessagingRemoteDataSource {
  Future<List<MessageModel>> fetchMessages(String conversationId) async {
    // Replace this mock implementation with real API call
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return [
      MessageModel(id: '1', content: 'Hello!', timestamp: DateTime.now(), isMine: true),
      MessageModel(id: '2', content: 'Hi there!', timestamp: DateTime.now(), isMine: false),
    ];
  }

  Future<void> sendMessage(MessageModel message) async {
    // Replace this mock implementation with real API call
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    debugPrint('Message sent: ${message.content}');
  }
}
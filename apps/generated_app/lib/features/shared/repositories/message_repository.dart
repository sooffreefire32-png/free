import 'package:flutter/foundation.dart';
import 'package:lance_it/features/shared/data/models/message_model.dart';
import 'package:lance_it/features/shared/datasources/messaging_remote_data_source.dart';

class MessageRepository {
  final MessagingRemoteDataSource remoteDataSource;

  MessageRepository({required this.remoteDataSource});

  Future<List<MessageModel>> getMessages(String conversationId) async {
    try {
      return await remoteDataSource.fetchMessages(conversationId);
    } catch (e) {
      debugPrint("Error in MessageRepository.getMessages: ".$e.toString());
      rethrow;
    }
  }

  Future<void> sendMessage(MessageModel message) async {
    try {
      await remoteDataSource.sendMessage(message);
    } catch (e) {
      debugPrint("Error in MessageRepository.sendMessage: ".$e.toString());
      rethrow;
    }
  }
}
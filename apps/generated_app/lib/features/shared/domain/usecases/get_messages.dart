import 'package:either_dart/either.dart';
import 'package:lance_it/features/shared/repositories/message_repository.dart';
import 'package:lance_it/features/shared/domain/entities/message.dart';
import 'package:lance_it/core/error/failures.dart';

class GetMessages {
  final MessageRepository repository;

  GetMessages(this.repository);

  Future<Either<Failure, List<Message>>> call(String chatId) async {
    return await repository.getMessages(chatId);
  }
}
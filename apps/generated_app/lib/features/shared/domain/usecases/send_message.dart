import 'package:either_dart/either.dart';
import 'package:lance_it/features/shared/repositories/message_repository.dart';
import 'package:lance_it/features/shared/domain/entities/message.dart';
import 'package:lance_it/core/error/failures.dart';

class SendMessage {
  final MessageRepository repository;

  SendMessage(this.repository);

  Future<Either<Failure, void>> call(Message message) async {
    return await repository.sendMessage(message);
  }
}
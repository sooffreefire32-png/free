import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/wallet_repository.dart';
import '../entities/transaction.dart';

class GetTransactions {
  final WalletRepository repository;

  GetTransactions(this.repository);

  Future<Either<Failure, List<Transaction>>> call({required int userId}) {
    return repository.getTransactions(userId);
  }
}
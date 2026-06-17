import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/wallet_repository.dart';

class RequestWithdrawal {
  final WalletRepository repository;

  RequestWithdrawal(this.repository);

  Future<Either<Failure, void>> call({required int userId, required double amount}) {
    return repository.requestWithdrawal(userId: userId, amount: amount);
  }
}
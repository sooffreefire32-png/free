import 'package:lance_it/features/wallet/data/datasources/wallet_remote_data_source.dart';
import 'package:lance_it/features/wallet/domain/entities/transaction.dart';

class WalletRepository {
  final WalletRemoteDataSource remoteDataSource;

  WalletRepository(this.remoteDataSource);

  Future<List<Transaction>> getTransactions() async {
    return await remoteDataSource.fetchTransactions();
  }

  Future<void> requestWithdrawal(double amount) async {
    await remoteDataSource.performWithdrawal(amount);
  }
}
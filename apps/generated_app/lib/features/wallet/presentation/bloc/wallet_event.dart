part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object?> get props => [];
}

class GetWalletTransactionsEvent extends WalletEvent {
  final int userId;

  const GetWalletTransactionsEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

class WithdrawRequestEvent extends WalletEvent {
  final int userId;
  final double amount;

  const WithdrawRequestEvent(this.userId, this.amount);

  @override
  List<Object?> get props => [userId, amount];
}
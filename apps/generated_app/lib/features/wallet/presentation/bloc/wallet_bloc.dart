import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/get_transactions.dart';
import '../../../domain/usecases/request_withdrawal.dart';
import '../../../domain/entities/transaction.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final GetTransactions getTransactions;
  final RequestWithdrawal requestWithdrawal;

  WalletBloc({required this.getTransactions, required this.requestWithdrawal}) : super(WalletInitial()) {
    on<GetWalletTransactionsEvent>(_onGetTransactions);
    on<WithdrawRequestEvent>(_onWithdrawRequest);
  }

  Future<void> _onGetTransactions(
    GetWalletTransactionsEvent event, 
    Emitter<WalletState> emit
  ) async {
    emit(WalletLoading());
    final result = await getTransactions.call(userId: event.userId);
    result.fold(
      (failure) => emit(WalletError(message: "Failed to load transactions.")), 
      (transactions) => emit(WalletLoaded(transactions: transactions))
    );
  }

  Future<void> _onWithdrawRequest(
    WithdrawRequestEvent event, 
    Emitter<WalletState> emit
  ) async {
    emit(WalletLoading());
    final result = await requestWithdrawal.call(userId: event.userId, amount: event.amount);
    result.fold(
      (failure) => emit(WalletError(message: "Failed to request withdrawal.")), 
      (_) => emit(WithdrawalSuccess())
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/wallet_bloc.dart';
import '../widgets/transaction_item.dart';

class WalletDashboardScreen extends StatelessWidget {
  final int userId;

  const WalletDashboardScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet Dashboard"),
      ),
      body: BlocProvider(
        create: (context) => WalletBloc(
          getTransactions: context.read(),
          requestWithdrawal: context.read(),
        )..add(GetWalletTransactionsEvent(userId)),
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            if (state is WalletLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WalletLoaded) {
              return ListView.builder(
                itemCount: state.transactions.length,
                itemBuilder: (context, index) {
                  return TransactionItem(transaction: state.transactions[index]);
                },
              );
            } else if (state is WalletError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("No transactions available."));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/withdraw', arguments: userId),
        child: const Icon(Icons.attach_money),
      ),
    );
  }
}
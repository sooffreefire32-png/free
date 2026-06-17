import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lance_it/features/wallet/data/models/transaction_model.dart';

abstract class WalletRemoteDataSource {
  Future<List<TransactionModel>> fetchTransactions();
  Future<void> performWithdrawal(double amount);
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  final http.Client client;

  WalletRemoteDataSourceImpl(this.client);

  @override
  Future<List<TransactionModel>> fetchTransactions() async {
    final url = Uri.parse('https://example.com/api/transactions');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => TransactionModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  @override
  Future<void> performWithdrawal(double amount) async {
    final url = Uri.parse('https://example.com/api/withdraw');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'amount': amount}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to perform withdrawal');
    }
  }
}
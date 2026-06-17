import 'package:lance_it/features/wallet/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  final String id;
  final double amount;
  final DateTime date;
  final String description;
  final String type;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.description,
    required this.type,
  }) : super(
          id: id,
          amount: amount,
          date: date,
          description: description,
          type: type,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      description: json['description'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'date': date.toIso8601String(),
      'description': description,
      'type': type,
    };
  }
}
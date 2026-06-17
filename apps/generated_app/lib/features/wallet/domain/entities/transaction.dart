import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final double amount;
  final DateTime date;
  final String description;
  final String type;

  const Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.description,
    required this.type,
  });

  @override
  List<Object?> get props => [id, amount, date, description, type];
}
import 'package:equatable/equatable.dart';

class Stats extends Equatable {
  final double earnings;
  final int activeContracts;
  final double rating;

  const Stats({
    required this.earnings,
    required this.activeContracts,
    required this.rating,
  });

  @override
  List<Object?> get props => [earnings, activeContracts, rating];
}
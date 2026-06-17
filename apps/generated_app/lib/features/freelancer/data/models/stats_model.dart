import '../../domain/entities/stats.dart';

class StatsModel extends Stats {
  const StatsModel({required super.earnings, required super.activeContracts, required super.rating});

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      earnings: json['earnings'],
      activeContracts: json['active_contracts'],
      rating: json['rating'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'earnings': earnings,
      'active_contracts': activeContracts,
      'rating': rating,
    };
  }
}
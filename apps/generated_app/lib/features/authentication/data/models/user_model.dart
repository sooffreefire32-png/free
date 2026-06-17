import 'package:json_annotation/json_annotation.dart';
import 'package:lance_it/features/authentication/domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required String id,
    required String email,
    required String name,
    required String role,
  }) : super(
          id: id,
          email: email,
          name: name,
          role: role,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
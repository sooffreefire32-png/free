import 'package:dartz/dartz.dart';
import 'package:lance_it/core/error/failures.dart';
import 'package:lance_it/features/authentication/domain/entities/user.dart';
import 'package:lance_it/features/authentication/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, User>> execute(String email, String password) async {
    return await repository.login(email, password);
  }
}
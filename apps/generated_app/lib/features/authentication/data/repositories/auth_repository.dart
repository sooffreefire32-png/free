import 'package:lance_it/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:lance_it/features/authentication/domain/entities/user.dart';
import 'package:lance_it/features/authentication/domain/usecases/login_user.dart';
import 'package:lance_it/features/authentication/domain/usecases/register_user.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepository(this.authRemoteDataSource);

  Future<User> login(LoginParams params) async {
    return await authRemoteDataSource.login(params);
  }

  Future<User> register(RegisterParams params) async {
    return await authRemoteDataSource.register(params);
  }
}
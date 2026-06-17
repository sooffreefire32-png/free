import 'package:lance_it/features/authentication/data/models/user_model.dart';
import 'package:lance_it/features/authentication/domain/usecases/login_user.dart';
import 'package:lance_it/features/authentication/domain/usecases/register_user.dart';

class AuthRemoteDataSource {
  Future<UserModel> login(LoginParams params) async {
    // Simulated API call (replace with actual HTTP request)
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: '1',
      email: params.email,
      name: 'John Doe',
      role: 'freelancer',
    );
  }

  Future<UserModel> register(RegisterParams params) async {
    // Simulated API call (replace with actual HTTP request)
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: '2',
      email: params.email,
      name: params.name,
      role: params.role,
    );
  }
}
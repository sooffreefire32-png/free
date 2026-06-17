import 'dart:async';
import '../models/user_model.dart';
class MockApi {
  static Future<User> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return User(id: '123', name: 'John Doe', email: 'john.doe@example.com', role: 'client');
  }
}

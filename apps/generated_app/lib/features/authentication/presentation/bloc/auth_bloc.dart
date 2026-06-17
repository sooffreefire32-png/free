import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lance_it/features/authentication/domain/entities/user.dart';
import 'package:lance_it/features/authentication/domain/usecases/login_user.dart';
import 'package:lance_it/features/authentication/domain/usecases/register_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  AuthBloc({required this.loginUser, required this.registerUser}) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      final failureOrUser = await loginUser.execute(event.email, event.password);
      failureOrUser.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (user) => emit(AuthAuthenticated(user: user)),
      );
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      final failureOrUser = await registerUser.execute(event.email, event.password);
      failureOrUser.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (user) => emit(AuthAuthenticated(user: user)),
      );
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthUnauthenticated());
    });
  }
}
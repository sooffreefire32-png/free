import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/update_profile.dart';
import '../../domain/entities/profile.dart';
import '../../repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateProfile updateProfile;

  ProfileBloc({required this.updateProfile}) : super(ProfileInitial()) {
    on<UpdateProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await updateProfile(event.profile);
      result.fold(
        (failure) => emit(ProfileError(message: failure.message)),
        (updatedProfile) => emit(ProfileUpdated(profile: updatedProfile)),
      );
    });
  }
}
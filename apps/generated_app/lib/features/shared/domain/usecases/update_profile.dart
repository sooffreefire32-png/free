import 'package:either_dart/either.dart';
import 'package:lance_it/features/shared/repositories/profile_repository.dart';
import 'package:lance_it/features/shared/domain/entities/profile.dart';
import 'package:lance_it/core/error/failures.dart';

class UpdateProfile {
  final ProfileRepository repository;

  UpdateProfile(this.repository);

  Future<Either<Failure, void>> call(Profile profile) async {
    return await repository.updateProfile(profile);
  }
}
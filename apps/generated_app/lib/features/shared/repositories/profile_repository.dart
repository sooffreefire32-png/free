import 'package:flutter/foundation.dart';
import 'package:lance_it/features/shared/data/models/profile_model.dart';
import 'package:lance_it/features/shared/datasources/profile_remote_data_source.dart';

class ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepository({required this.remoteDataSource});

  Future<ProfileModel> getProfile(String userId) async {
    try {
      return await remoteDataSource.fetchProfile(userId);
    } catch (e) {
      debugPrint("Error in ProfileRepository.getProfile: ".$e.toString());
      rethrow;
    }
  }

  Future<void> updateProfile(ProfileModel profile) async {
    try {
      await remoteDataSource.updateProfile(profile);
    } catch (e) {
      debugPrint("Error in ProfileRepository.updateProfile: ".$e.toString());
      rethrow;
    }
  }
}
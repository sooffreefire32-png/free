import 'package:flutter/foundation.dart';
import 'package:lance_it/features/shared/data/models/profile_model.dart';

class ProfileRemoteDataSource {
  Future<ProfileModel> fetchProfile(String userId) async {
    // Replace this mock implementation with real API call
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return ProfileModel(
      id: userId,
      name: "John Doe",
      email: "johndoe@example.com",
      avatarUrl: null,
      skills: ['Flutter', 'Dart', 'Firebase'],
      bio: "Experienced Flutter developer.",
    );
  }

  Future<void> updateProfile(ProfileModel profile) async {
    // Replace this mock implementation with real API call
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    debugPrint('Profile updated: ${profile.name}');
  }
}
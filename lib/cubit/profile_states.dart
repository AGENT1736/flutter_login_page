import 'package:ict_hub_session/model/user_profile.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class ProfileLoading extends ProfileStates {}

class ProfileLoaded extends ProfileStates {
  final UserProfile userProfile;
  ProfileLoaded(this.userProfile);
}

class ProfileError extends ProfileStates {
  final String message;
  ProfileError(this.message);
}

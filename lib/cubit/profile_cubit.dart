import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_session/cubit/profile_states.dart';
import 'package:ict_hub_session/model/user_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final Dio dio = Dio();
  final SupabaseClient supabase = Supabase.instance.client;

  ProfileCubit() : super(ProfileInitial());

  Future<void> fetchUserProfile() async {
    emit(ProfileLoading());

    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        emit(ProfileError("user not logged in!"));
        return;
      }

      final response =
          await supabase.from('profiles').select().eq('id', user.id).single();

      final userProfile = UserProfile.fromJson(response);
      emit(ProfileLoaded(userProfile));
    } catch (e) {
      emit(ProfileError("Failed to loaded profile :("));
    }
  }
}

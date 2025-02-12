import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
import 'package:ict_hub_session/cubit/auth_states.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../api/auth_service.dart';

final supabase = Supabase.instance.client;

class AuthCubit extends Cubit<AuthStates> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitialState());

  //Register with dio backend
  Future<void> register(String email, String username, String password) async {
    emit(AuthLoadingState());

    try {
      final response = await authService.register(email, username, password);

      if (response.containsKey("error")) {
        emit(AuthErrorState());
      } else {
        emit(AuthSuccessState());
      }
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  //Login with dio backend
  Future<void> login(String email, String password) async {
    emit(AuthLoadingState());

    //this is the part where the dio endpoint will be called
    final response = await authService.login(email, password);

    //this is where the response will happen
    if (response.containsKey("error")) {
      emit(AuthErrorState());
    } else {
      emit(AuthSuccessState());
    }
  }

  Future<void> logout() async {
    emit(AuthLoadingState());

    try {
      final response = await authService.logout();
      if (response.containsKey("error")) {
        emit(AuthErrorState());
      } else {
        emit(AuthInitialState());
      }
    } catch (e) {
      emit(AuthErrorState());
    }
  }
}

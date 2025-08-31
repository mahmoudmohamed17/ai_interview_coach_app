import 'dart:developer';

import 'package:ai_interview_coach_app/backend/services/supabase_auth_service.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.supabaseAuthService) : super(AuthInitial());

  final SupabaseAuthService supabaseAuthService;

  Future<void> logIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final result = await supabaseAuthService.logIn(
        email: email,
        password: password,
      );
      emit(AuthLoggedIn(user: result.user!));
    } catch (e) {
      emit(const AuthError(message: 'Invalid email or password.'));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    Map<String, dynamic>? userData,
  }) async {
    emit(AuthLoading());
    try {
      final result = await supabaseAuthService.signUp(
        email: email,
        password: password,
        userData: {
          'full_name': userData!['full_name'],
          'profile_pic': userData['profile_pic'],
        },
      );
      emit(AuthRegistered(user: result.user!));
    } catch (e) {
      log(e.toString());
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final result = await supabaseAuthService.signInWithGoogle();
      emit(AuthLoggedIn(user: result.user!));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await supabaseAuthService.signOut();
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}

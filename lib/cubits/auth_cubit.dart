import 'dart:developer';
import 'package:ai_interview_coach_app/backend/models/user_data_model.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_auth_service.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show AuthApiException;

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
    } on AuthApiException catch (e) {
      emit(AuthError(message: e.message));
    } catch (e) {
      log(e.toString());
      emit(const AuthError(message: 'Something went wrong'));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    UserDataModel? userDataModel,
  }) async {
    emit(AuthLoading());
    try {
      final result = await supabaseAuthService.signUp(
        email: email,
        password: password,
        userDataModel: userDataModel,
      );
      emit(AuthRegistered(user: result.user!));
    } on AuthApiException catch (e) {
      emit(AuthError(message: e.message));
    } catch (e) {
      emit(const AuthError(message: 'Something went wrong.'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final result = await supabaseAuthService.signInWithGoogle();
      emit(AuthLoggedIn(user: result.user!));
    } on AuthApiException catch (e) {
      emit(AuthError(message: e.message));
    } catch (e) {
      emit(const AuthError(message: 'Something went wrong'));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await supabaseAuthService.signOut();
      emit(AuthLoggedOut());
    } on AuthApiException catch (e) {
      emit(AuthError(message: e.message));
    } catch (e) {
      emit(const AuthError(message: 'Something went wrong'));
    }
  }

  Future<void> updateUser({
    String? email,
    String? password,
    UserDataModel? userDataModel,
  }) async {
    emit(AuthLoading());
    try {
      final result = await supabaseAuthService.updateUser(
        email: email,
        password: password,
        userDataModel: userDataModel,
      );
      emit(AuthUpdated(user: result.user!));
    } on AuthApiException catch (e) {
      emit(AuthError(message: e.message));
    } catch (e) {
      emit(const AuthError(message: 'Something went wrong'));
    }
  }
}

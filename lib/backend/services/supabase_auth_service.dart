import 'dart:developer';

import 'package:ai_interview_coach_app/core/secret/app_secret.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final _client = Supabase.instance.client.auth;
  User? get currentUser => _client.currentUser;

  Future<AuthResponse> logIn({
    required String email,
    required String password,
  }) async {
    final user = await _client.signInWithPassword(
      email: email,
      password: password,
    );
    log('Normal user: $user');
    return user;
  }

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    Map<String, dynamic>? userData,
  }) async {
    return await _client.signUp(
      email: email,
      password: password,
      data: userData,
    );
  }

  Future<void> signOut() async {
    await _client.signOut();
  }

  Future<AuthResponse> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
      clientId: AppSecret.appAndroidClientId,
      serverClientId: AppSecret.appWebClientId,
    );
    final googleUser = await googleSignIn.authenticate();
    final googleAuth = googleUser.authentication;
    final idToken = googleAuth.idToken;
    if (idToken == null) {
      throw 'No ID Token found.';
    }
    final user = await _client.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
    );
    log('Google user: $user');
    return user;
  }
}

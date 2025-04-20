import 'package:florida_rental_car/app/data/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client;

  AuthService(this._client);

  Future<void> signIn(String email, String password) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.session == null) {
      throw Exception('Failed to sign in: Invalid email or password.');
    }
  }

  // sign up a new user
  Future<void> signUpWithDetails({
    required ProfileModel profile,
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {
        'first_name': profile.name,
        'last_name': profile.lastName,
        'phone': profile.phoneNumber,
      },
    );
    if (response.user == null) {
      throw Exception('Failed to sign up: Invalid email or password.');
    }
  }

  // sign out the user
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  // get the current user
  User? getCurrentUser() {
    return _client.auth.currentUser;
  }

  // check if the user is authenticated
  bool isAuthenticated() {
    return _client.auth.currentSession != null;
  }

  // get the current session
  Session? getCurrentSession() {
    return _client.auth.currentSession;
  }

  // logout the user
  Future<void> logout() async {
    await _client.auth.signOut();
  }
}

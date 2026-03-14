import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  Stream<User?> authStateChanges() => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<void> signInWithEmailPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> registerWithEmailPassword(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signInWithGoogle() async {
    // TODO: Implement actual Google SignIn with google_sign_in package
    // For now, this is a stub for UI wiring
    debugPrint('Google Sign-In Triggered');
  }

  Future<void> signInWithPhone(String phoneNumber) async {
    // TODO: Implement actual Firebase Phone Auth (verifyPhoneNumber)
    // For now, this is a stub for UI wiring
    debugPrint('Phone Sign-In Triggered for $phoneNumber');
  }
}

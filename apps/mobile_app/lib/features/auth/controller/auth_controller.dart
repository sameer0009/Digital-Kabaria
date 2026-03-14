import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_models/domain_models.dart';
import 'package:data_layer/data_layer.dart';

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(AuthController.new);

class AuthController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).signInWithEmailPassword(email, password));
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required UserRole role,
    String? businessName,
    String? gstNumber,
    String? businessAddress,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).registerWithEmailPassword(email, password);
      // Create user profile in data layer
      final profile = UserProfile(
        uid: ref.read(authRepositoryProvider).currentUser!.uid,
        role: role,
        name: name,
        email: email,
        phone: '', // Placeholder
        businessName: businessName,
        gstNumber: gstNumber,
        businessAddress: businessAddress,
        registrationDate: DateTime.now(),
      );
      await ref.read(userRepositoryProvider).saveProfile(profile);
    });
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).signOut());
  }

  Future<void> loginWithGoogle() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).signInWithGoogle());
  }

  Future<void> loginWithPhone(String phoneNumber) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).signInWithPhone(phoneNumber));
  }
}

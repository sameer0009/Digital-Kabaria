import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:domain_models/domain_models.dart';
import 'package:data_layer/data_layer.dart';

final dealerProfileProvider = StreamProvider<UserProfile?>((ref) {
  final uid = ref.watch(authStateChangesProvider).value?.uid;
  if (uid == null) return Stream.value(null);
  return ref.watch(userRepositoryProvider).watchProfile(uid);
});

final matchingLeadsProvider = StreamProvider<List<Listing>>((ref) {
  final profile = ref.watch(dealerProfileProvider).value;
  // If profile is not yet loaded, we can still show all submitted leads or wait.
  // For MVP, if no categories are set, show all.
  return ref.watch(listingRepositoryProvider).watchMatchingLeads(
    categories: profile?.categoriesHandled,
  );
});

final dealerControllerProvider = AsyncNotifierProvider<DealerController, void>(DealerController.new);

class DealerController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> submitQuote({
    required String listingId,
    required double amount,
    String? message,
    String? expectedPickupTiming,
  }) async {
    final uid = ref.read(authStateChangesProvider).value?.uid;
    if (uid == null) {
      state = AsyncValue.error('User not logged in', StackTrace.current);
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final quoteId = const Uuid().v4();
      
      final quote = Quote(
        id: quoteId,
        listingId: listingId,
        dealerId: uid,
        amount: amount,
        message: message,
        expectedPickupTiming: expectedPickupTiming,
        status: QuoteStatus.sent,
      );

      await ref.read(quoteRepositoryProvider).submitQuote(quote);
    });
  }
}

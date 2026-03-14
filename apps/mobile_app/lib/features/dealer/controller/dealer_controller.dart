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

final dealerLeadFiltersProvider = NotifierProvider<DealerLeadFilters, List<String>?>(DealerLeadFilters.new);

class DealerLeadFilters extends Notifier<List<String>?> {
  @override
  List<String>? build() => null;

  void setFilters(List<String>? categories) => state = categories;
}

final matchingLeadsProvider = StreamProvider<List<Listing>>((ref) {
  final profile = ref.watch(dealerProfileProvider).value;
  final manualFilters = ref.watch(dealerLeadFiltersProvider);
  
  // Use manual filters if set, otherwise fallback to profile categories, or show all.
  final effectiveCategories = manualFilters ?? profile?.categoriesHandled;
  
  return ref.watch(listingRepositoryProvider).watchMatchingLeads(
    categories: effectiveCategories,
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

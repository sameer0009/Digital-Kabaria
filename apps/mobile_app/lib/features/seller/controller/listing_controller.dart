import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:domain_models/domain_models.dart';
import 'package:data_layer/data_layer.dart';

final sellerListingsProvider = StreamProvider.autoDispose<List<Listing>>((ref) {
  final repo = ref.watch(listingRepositoryProvider);
  final user = ref.watch(authStateChangesProvider).value;
  if (user == null) return Stream.value([]);
  return repo.watchSellerListings(user.uid);
});

final listingControllerProvider = AsyncNotifierProvider<ListingController, void>(ListingController.new);

class ListingController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> createListing({
    required String title,
    required String description,
    required String categoryId,
    required double quantity,
    required String unit,
    List<File>? images,
  }) async {
    final uid = ref.read(authStateChangesProvider).value?.uid;
    if (uid == null) {
      state = AsyncValue.error('User not logged in', StackTrace.current);
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final listingId = const Uuid().v4();
      
      List<String> imageUrls = [];
      if (images != null && images.isNotEmpty) {
        imageUrls = await ref.read(storageRepositoryProvider).uploadListingImages(listingId, images);
      }

      final listing = Listing(
        id: listingId,
        sellerId: uid,
        title: title,
        description: description,
        categoryId: categoryId,
        quantityEstimate: quantity,
        unit: unit,
        images: imageUrls,
        status: ListingStatus.submitted,
      );

      await ref.read(listingRepositoryProvider).createListing(listing);
    });
  }

  Future<void> acceptQuote(Listing listing, Quote quote) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final orderId = const Uuid().v4();
      
      // 1. Create Pickup Order
      final order = PickupOrder(
        id: orderId,
        listingId: listing.id,
        quoteId: quote.id,
        sellerId: listing.sellerId,
        dealerId: quote.dealerId,
        status: PickupStatus.scheduled,
        createdAt: DateTime.now(),
      );
      await ref.read(pickupRepositoryProvider).createPickup(order);

      // 2. Update Listing status
      final updatedListing = listing.copyWith(status: ListingStatus.pickedUp);
      await ref.read(listingRepositoryProvider).createListing(updatedListing);

      // 3. Update Quote status
      final updatedQuote = quote.copyWith(status: QuoteStatus.accepted);
      await ref.read(quoteRepositoryProvider).submitQuote(updatedQuote);
    });
  }
}

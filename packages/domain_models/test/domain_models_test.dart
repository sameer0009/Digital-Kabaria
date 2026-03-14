import 'package:domain_models/domain_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Listing Model', () {
    test('should serialize and deserialize correctly', () {
      final listing = Listing(
        id: '1',
        sellerId: 'seller_123',
        title: 'Old Paper',
        description: 'Newspapers and books',
        categoryId: 'cat_paper',
        quantityEstimate: 10.5,
        unit: 'kg',
        status: ListingStatus.submitted,
        createdAt: DateTime.now(),
      );

      final json = listing.toJson();
      expect(json['id'], '1');
      expect(json['sellerId'], 'seller_123');
      expect(json['status'], 'submitted');

      final deserialized = Listing.fromJson(json);
      expect(deserialized.title, 'Old Paper');
      expect(deserialized.quantityEstimate, 10.5);
    });
  });

  group('UserProfile Model', () {
    test('should serialize and deserialize correctly', () {
      final profile = UserProfile(
        uid: 'usr_1',
        role: UserRole.dealer,
        name: 'Dealer Pro',
        phone: '1234567890',
        businessName: 'Professional Recyclers',
        isVerified: true,
      );

      final json = profile.toJson();
      expect(json['uid'], 'usr_1');
      expect(json['role'], 'dealer');

      final deserialized = UserProfile.fromJson(json);
      expect(deserialized.businessName, 'Professional Recyclers');
    });
  });

  group('Quote Model', () {
    test('should serialize and deserialize correctly', () {
      final quote = Quote(
        id: 'q_1',
        listingId: 'l_1',
        dealerId: 'd_1',
        amount: 50.0,
        status: QuoteStatus.sent,
        createdAt: DateTime.now(),
      );

      final json = quote.toJson();
      expect(json['amount'], 50.0);
      expect(json['status'], 'sent');

      final deserialized = Quote.fromJson(json);
      expect(deserialized.amount, 50.0);
    });
  });
}

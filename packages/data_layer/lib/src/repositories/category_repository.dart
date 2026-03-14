
import 'package:domain_models/domain_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

class CategoryRepository {
  // Hardcoded for MVP, in a real app this would fetch from Firestore.
  Future<List<ScrapCategory>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      ScrapCategory(id: 'cat_paper', name: 'Paper & Cardboard', unit: 'kg', iconUrl: 'description'),
      ScrapCategory(id: 'cat_plastic', name: 'Plastic', unit: 'kg', iconUrl: 'recycling'),
      ScrapCategory(id: 'cat_metal', name: 'Metal', unit: 'kg', iconUrl: 'hardware'),
      ScrapCategory(id: 'cat_ewaste', name: 'E-Waste', unit: 'piece', iconUrl: 'computer'),
    ];
  }
}

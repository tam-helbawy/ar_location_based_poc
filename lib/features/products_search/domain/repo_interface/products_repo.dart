import 'package:base/features/products_search/domain/models/category.dart';
import '../models/product.dart';

abstract class ProductsRepoInterface {
  Future<List<Product>> getProducts({String? categoryId});
  Future<List<Category>> getCategories();
}
import '../models/product_details.dart';

abstract class ProductDetailsRepoInterface {
  Future<ProductDetails> getProductDetails(String productId);
}
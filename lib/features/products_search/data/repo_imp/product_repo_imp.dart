import 'package:base/features/products_search/domain/models/category.dart';
import 'package:base/features/products_search/domain/models/product.dart';
import 'package:base/features/products_search/domain/repo_interface/products_repo.dart';
import 'package:base/network/app_end_points.dart';
import 'package:dio/dio.dart';

import '../../../../network/network_handler.dart';

class ProductsRepoImp implements ProductsRepoInterface {
  @override
  Future<List<Product>> getProducts({String? categoryId}) async {
    Response response = await NetworkHandler.instance.get(
      AppEndPoints.productsSearch,
      queryParameters: {
        if(categoryId != null) 'categoryId': categoryId,
      }
    );
    List<Product> products = [];
    for (var productData in response.data) {
      Product product = Product.fromJson(productData);
      products.add(product);
    }
    return products;
  }

  @override
  Future<List<Category>> getCategories() async {
    Response response = await NetworkHandler.instance.get(AppEndPoints.categories);
    List<Category> categories = [];
    for (var categoryData in response.data) {
      Category product = Category.fromJson(categoryData);
      categories.add(product);
    }
    return categories;
  }
}

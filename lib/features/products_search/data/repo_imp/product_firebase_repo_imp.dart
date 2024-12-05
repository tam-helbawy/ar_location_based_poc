import 'package:base/features/products_search/domain/models/category.dart';

import 'package:base/features/products_search/domain/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repo_interface/products_repo.dart';

class ProductFirebaseRepoImp implements ProductsRepoInterface {
  @override
  Future<List<Category>> getCategories() async{
    return [];
  }

  @override
  Future<List<Product>> getProducts({String? categoryId}) async {
    var db = FirebaseFirestore.instance;
    List<Product> productsList = [];
    QuerySnapshot response = await db.collection("products").get();
    response.docs.forEach((element) {
      productsList.add(
        Product(
          id: element.id,
          name: (element.data() as Map)["name"],
          price: (element.data() as Map)["price"],
          imageUrl: (element.data() as Map)["imageUrl"],
          description: (element.data() as Map)["description"],
        ),
      );
    });
    return productsList;
  }
}

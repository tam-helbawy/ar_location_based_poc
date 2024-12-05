import 'package:base/features/product_details/domain/models/product_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repo_interface/product_details_interface.dart';

class ProductDetailsFirebaseRepoImp implements ProductDetailsRepoInterface {
  @override
  Future<ProductDetails> getProductDetails(String productId) async {
    var db = FirebaseFirestore.instance;
    //============= test adding
    db.collection('products').add({
      "name": "product 1",
      "description": "product 1 description",
      "price": 100,
      "imageUrl": "https://images.pexels.com/photos/1656684/pexels-photo-1656684.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    });
    //=========================================
    DocumentSnapshot response = await db.collection('products').doc(productId).get();
    ProductDetails productDetails = ProductDetails(
      name: (response.data() as Map)['name'],
      description: (response.data() as Map)['description'],
      price: (response.data() as Map)['price'],
      imageUrls: [(response.data() as Map)['imageUrl']],
    );
    return productDetails;
  }
}

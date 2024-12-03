import 'package:base/network/app_end_points.dart';
import 'package:base/network/network_handler.dart';
import 'package:dio/dio.dart';
import '../../domain/models/product_details.dart';
import '../../domain/repo_interface/product_details_interface.dart';

class ProductDetailsRepoImp implements ProductDetailsRepoInterface{
  @override
  Future<ProductDetails> getProductDetails(String productId)async{
    Response response = await NetworkHandler.instance.get(AppEndPoints.productsDetails(productId));
    return ProductDetails.fromJson(response.data);
  }
}
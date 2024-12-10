import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/models/product.dart';

class ProductCardListView extends StatelessWidget {
  const ProductCardListView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      onTap: (){
      },
      leading: Image.network(product.imageUrl, width: 75, height: 75, fit: BoxFit.cover),
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: Text(product.price.toString()),
    );
  }
}
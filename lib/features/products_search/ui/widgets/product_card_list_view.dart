import 'package:flutter/material.dart';

import '../../domain/models/product.dart';

class ProductCardListView extends StatelessWidget {
  const ProductCardListView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      leading: Image.network(product.imageUrl, width: 75, height: 75, fit: BoxFit.cover),
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: Text(product.price.toString()),
    );
  }
}
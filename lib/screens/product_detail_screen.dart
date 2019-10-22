import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/product.dart';

import '../providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productID =
        ModalRoute.of(context).settings.arguments as String;

    final Product selectedProduct =
        Provider.of<Products>(context, listen: false).findById(productID);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.title),
      ),
    );
  }
}

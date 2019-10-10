import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {

  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productID = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(productID),),
    );
  }
}
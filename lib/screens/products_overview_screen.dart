import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/product_item.dart';

import '../providers/products.dart';

enum FilterOptions { Fav, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _favOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Fav) {
                  //
                  this._favOnly = true;
                } else {
                  //
                  this._favOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Fav'), value: FilterOptions.Fav),
              PopupMenuItem(child: Text('Fav'), value: FilterOptions.All),
            ],
          )
        ],
      ),
      body: ProductsGrid(this._favOnly),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = this.showFavs ? productsData.items : productsData.favs;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (_, i) => ChangeNotifierProvider(
          builder: (c) => products[i], child: ProductItem()),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}

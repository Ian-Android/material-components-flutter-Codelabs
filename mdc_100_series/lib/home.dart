import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {

  final Category category;

  const HomePage({
    this.category: Category.all
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('SHRINE'),
//        leading: IconButton(
//          icon: Icon(
//            Icons.menu,
//            semanticLabel: 'menu',
//          ),
//          onPressed: () {
//            print('Menu button');
//          },
//        ),
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(
//                Icons.search,
//                semanticLabel: 'search',
//              ),
//              onPressed: () {
//                print('Search button');
//              }),
//          IconButton(
//              icon: Icon(
//                Icons.tune,
//                semanticLabel: 'filter',
//              ),
//              onPressed: () {
//                print('Filter button');
//              }),
//        ],
//      ),
////        body: GridView.count(
////            crossAxisCount: 2,
////            padding: EdgeInsets.all(16.0),
////            childAspectRatio: 8.0 / 9.0,
////            children: _buildGridCards(context))
//      body: AsymmetricView(
//        products: Products_repository.loadProducts(Category.all),
//      ),
//    );

  return AsymmetricView(
    products: Products_repository.loadProducts(category),
  );
  }

  ///构建card
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = Products_repository.loadProducts(Category.all);
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString(),
    );

    return products
        .map((product) => Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset(
                      product.assetName,
                      package: product.assetPackage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            product == null ? '' : product.name,
                            style: theme.textTheme.button,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            product == null
                                ? ''
                                : formatter.format(product.price),
                            style: theme.textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }
}

import 'package:flutter/material.dart';
import 'package:technicaltest/utils/load_product.dart';
import 'package:technicaltest/utils/product_card_large.dart';
import 'package:technicaltest/utils/product_card_small.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key, required this.categoryName, required this.url});
  String categoryName;
  String url;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('$categoryName Products'),
              backgroundColor: Colors.blue,
              actions: [],
            ),
            body: FutureBuilder(
              future: getProducts(url),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return LayoutBuilder(builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ProductCardLarge(
                              product: snapshot.data![index]);
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ProductCardSmall(
                              product: snapshot.data![index]);
                        },
                      );
                    }
                  });
                }
              },
            )));
  }
}

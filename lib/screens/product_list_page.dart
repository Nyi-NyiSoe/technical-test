import 'package:flutter/material.dart';
import 'package:technicaltest/utils/load_product.dart';
import 'package:technicaltest/utils/product_card.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key, required this.categoryName});
  String categoryName;

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
              future: getProducts(categoryName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: snapshot.data![index]);
                    },
                  );
                }
              },
            )));
  }
}

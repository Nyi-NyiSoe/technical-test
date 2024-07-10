import 'package:flutter/material.dart';
import 'package:technicaltest/models/Product.dart';
import 'package:technicaltest/widgets/change_theme.dart';
import 'package:technicaltest/widgets/custom_carousel.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productDetailsCards = [];
    for (var entry in product.toJson().entries) {
      if (entry.key == 'id' ||
          entry.key == 'title' ||
          entry.key == 'description' ||
          entry.key == 'dimensions' ||
          entry.key == 'reviews' ||
          entry.key == 'meta' ||
          entry.key == 'images' ||
          entry.key == 'thumbnail') {
        continue;
      } else {
        productDetailsCards.add(
          ListTile(
              leading: Text(entry.key,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 15)),
              trailing: Text(
                  entry.value is List
                      ? entry.value.join(',')
                      : entry.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 15))),
        );
      }
    }

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [changeTheme()],
          ),
          body: Column(
            children: [
              CustomCarouselImage(product: product),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title!,
                ),
              ),
              const TabBar(
                tabs: [
                  Tab(
                    child: Text('Description', style: TextStyle(fontSize: 15)),
                  ),
                  Tab(
                      child: Text('Specifications',
                          style: TextStyle(fontSize: 15))),
                  Tab(child: Text('Reviews', style: TextStyle(fontSize: 15))),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Tab 1: Description
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            product.description!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('\$${product.price!.toStringAsFixed(2)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            fontSize: 15, color: Colors.green)),
                                Text(
                                    '${product.discountPercentage!.toStringAsFixed(2)}% off',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            fontSize: 15, color: Colors.red)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // Tab 2: Specifications
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: productDetailsCards,
                      ),
                    ),
                    // Tab 3: Reviews
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: product.reviews!.map((review) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            child: ListTile(
                              title: Text(
                                review['reviewerName'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(review['comment']),
                              trailing: const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



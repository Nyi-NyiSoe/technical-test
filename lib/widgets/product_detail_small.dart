import 'package:flutter/material.dart';
import 'package:technicaltest/models/Product.dart';
import 'package:technicaltest/widgets/custom_carousel.dart';
import 'package:technicaltest/widgets/review_widget.dart';

class ProductDetailSmall extends StatelessWidget {
  const ProductDetailSmall({
    super.key,
    required this.product,
    required this.productDetailsCards,
  });

  final Product product;
  final List<Widget> productDetailsCards;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About this item',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontSize: 18)),
                    Text(
                      product.description!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 16),
                    ),
                    Wrap(
                      spacing: 6.0,
                      runSpacing: 6.0,
                      children: product.tags!
                          .map((tag) => Chip(
                                  label: Text(
                                tag,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium,
                              )))
                          .toList(),
                    ),
                    const SizedBox(height: 10),
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
                  padding: const EdgeInsets.only(bottom: 80),
                  children: product.reviews!.map((review) {
                    return ReviewWidget(
                        rating: review['rating'],
                        comment: review['comment'],
                        date: review['date'],
                        reviewerName: review['reviewerName']);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

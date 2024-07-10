import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technicaltest/models/Product.dart';
import 'package:technicaltest/screens/cartpage.dart';
import 'package:technicaltest/utils/custom_toast.dart';
import 'package:technicaltest/widgets/cart_provider.dart';
import 'package:technicaltest/widgets/change_theme.dart';
import 'package:technicaltest/widgets/custom_carousel.dart';
import 'package:technicaltest/widgets/review_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

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
            title: Text(AppLocalizations.of(context)!.productDetails),
            actions: [
              changeTheme(),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CartPage();
                    }));
                  },
                  icon: const Icon(Icons.shopping_cart))
            ],
          ),
          bottomSheet: Consumer(builder: (context, ref, child) {
            return Container(
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      showToast(
                          AppLocalizations.of(context)!.toastmsg, Colors.red);
                    },
                    icon: const Icon(Icons.share),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                AppLocalizations.of(context)!.addtocart,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text(
                                AppLocalizations.of(context)!.addConfirm,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.cancel)),
                                        IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(cartProvider.notifier)
                                                  .addToCart(product);
                                              showToast(
                                                  AppLocalizations.of(context)!
                                                      .addConfirmed,
                                                  Colors.green);
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.check))
                                      ],
                                    ))
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    color: Colors.white,
                  ),
                  TextButton(
                    onPressed: () {
                      showToast(AppLocalizations.of(context)!.toastmsg,
                          Colors.red);
                    },
                    child: Text(AppLocalizations.of(context)!.buyNow,
                        style: Theme.of(context).textTheme.labelMedium),
                  )
                ],
              ),
            );
          }),
          body: Column(
            children: [
              CustomCarouselImage(product: product),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title!,
                ),
              ),
              TabBar(
                tabs: [
                  Tab(
                    child: Text(AppLocalizations.of(context)!.description,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Tab(
                      child: Text(AppLocalizations.of(context)!.specifications,
                          style: TextStyle(fontSize: 15))),
                  Tab(
                      child: Text(AppLocalizations.of(context)!.reviews,
                          style: TextStyle(fontSize: 15))),
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
                          Text(AppLocalizations.of(context)!.aboutItem,
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
          ),
        ),
      ),
    );
  }
}


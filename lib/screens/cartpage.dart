import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technicaltest/screens/product_detail_page.dart';
import 'package:technicaltest/widgets/cart_provider.dart';
import 'package:technicaltest/widgets/product_card_large.dart';
import 'package:technicaltest/widgets/product_card_small.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Cart'),
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Delete Cart',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text(
                                'Are you sure you want to delete the cart?',
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
                                                  .clearCart();
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.check))
                                      ],
                                    ))
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.remove_shopping_cart))
              ],
            ),
            body: cartItems.isEmpty
                ? const Center(
                    child: Text('No items in the cart'),
                  )
                : LayoutBuilder(builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetailPage(
                                  product: cartItems[index].product);
                            })),
                            child: ProductCardLarge(
                                product: cartItems[index].product),
                          );
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetailPage(
                                  product: cartItems[index].product);
                            })),
                            child: ProductCardSmall(
                                product: cartItems[index].product),
                          );
                        },
                      );
                    }
                  })));
  }
}
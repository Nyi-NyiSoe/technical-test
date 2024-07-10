import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technicaltest/screens/product_detail_page.dart';
import 'package:technicaltest/utils/cart_provider.dart';
import 'package:technicaltest/utils/custom_toast.dart';
import 'package:technicaltest/widgets/change_theme.dart';
import 'package:technicaltest/widgets/product_card_large.dart';
import 'package:technicaltest/widgets/product_card_small.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return SafeArea(
        child: Scaffold(
            floatingActionButton: ElevatedButton(
              onPressed: () {
                showToast(AppLocalizations.of(context)!.toastmsg, Colors.red);
              },
              child: Consumer(builder: (context, ref, child) {
                return Text('${AppLocalizations.of(context)!.total} \$${ref.watch(cartProvider.notifier).totalPrice.toStringAsFixed(2)}');
              }),
            ),
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.cart),
              actions: [
                changeTheme(),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                AppLocalizations.of(context)!.deleteTitle,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text(
                                AppLocalizations.of(context)!.deleteConfirm,
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
                ? Center(
                    child: Text(AppLocalizations.of(context)!.emptyCart),
                  )
                : LayoutBuilder(builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 1,
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
                            child: Column(
                              children: [
                                Container(
                                  constraints: const BoxConstraints(minHeight: 200),
                                  child: ProductCardLarge(
                                      product: cartItems[index].product),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .deleteFromCart(
                                                  cartItems[index].product);
                                        },
                                      ),
                                      Text('${cartItems[index].quantity}'),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .addToCart(
                                                  cartItems[index].product);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ProductCardSmall(
                                        product: cartItems[index].product),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .deleteFromCart(
                                                  cartItems[index].product);
                                        },
                                      ),
                                      Text('${cartItems[index].quantity}'),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .addToCart(
                                                  cartItems[index].product);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ));
                        },
                      );
                    }
                  })));
  }
}

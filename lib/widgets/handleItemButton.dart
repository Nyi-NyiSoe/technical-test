import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technicaltest/models/Product.dart';
import 'package:technicaltest/utils/custom_toast.dart';
import 'package:technicaltest/widgets/cart_provider.dart';

class HandleItemButton extends StatelessWidget {
  const HandleItemButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              showToast(
                  "Function to be implimented in future updates", Colors.red);
            },
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Add to Cart',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text(
                        'Do you want to add to cart?',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      showToast('Successfully added to cart!',
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
            icon: const Icon(Icons.add_shopping_cart_outlined),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).secondaryHeaderColor),
            onPressed: () {
              showToast(
                  "Function to be implimented in future updates", Colors.red);
            },
            child:
                Text('Buy Now', style: Theme.of(context).textTheme.labelMedium),
          )
        ],
      );
    });
  }
}

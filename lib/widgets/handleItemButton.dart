import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technicaltest/models/Product.dart';
import 'package:technicaltest/utils/cart_provider.dart';
import 'package:technicaltest/utils/custom_toast.dart';

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
              showToast(AppLocalizations.of(context)!.toastmsg, Colors.red);
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
            icon: const Icon(Icons.add_shopping_cart_outlined),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).secondaryHeaderColor),
            onPressed: () {
              showToast(AppLocalizations.of(context)!.toastmsg, Colors.red);
            },
            child: Text(AppLocalizations.of(context)!.buyNow,
                style: Theme.of(context).textTheme.labelMedium),
          )
        ],
      );
    });
  }
}

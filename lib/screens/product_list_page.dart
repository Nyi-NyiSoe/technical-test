import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:technicaltest/screens/product_detail_page.dart';
import 'package:technicaltest/utils/change_theme.dart';
import 'package:technicaltest/utils/load_product.dart';
import 'package:technicaltest/utils/product_card_large.dart';
import 'package:technicaltest/utils/product_card_small.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage(
      {super.key, required this.categoryName, required this.url});
  final String categoryName;
  final String url;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                  "$categoryName ${AppLocalizations.of(context)!.products}"),
              actions: [changeTheme()],
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
                          return InkWell(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetailPage(
                                  product: snapshot.data![index]);
                            })),
                            child: ProductCardLarge(
                                product: snapshot.data![index]),
                          );
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetailPage(
                                  product: snapshot.data![index]);
                            })),
                            child: ProductCardSmall(
                                product: snapshot.data![index]),
                          );
                        },
                      );
                    }
                  });
                }
              },
            )));
  }
}

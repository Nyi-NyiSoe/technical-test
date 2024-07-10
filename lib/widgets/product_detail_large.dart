import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:technicaltest/models/Product.dart';
import 'package:technicaltest/widgets/custom_carousel.dart';
import 'package:technicaltest/widgets/handleItemButton.dart';
import 'package:technicaltest/widgets/review_widget.dart';
class ProductDetailLarge extends StatelessWidget {
  const ProductDetailLarge(
      {super.key, required this.product, required this.productDetailsCards});
  final Product product;
  final List<Widget> productDetailsCards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CustomCarouselImage(product: product)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(product.title!),
                      HandleItemButton(product: product)
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.description),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.description!),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.specifications,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: productDetailsCards),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.reviews),
            ),
            Column(
              children: product.reviews!
                  .map((review) => ReviewWidget(
                      rating: review['rating'],
                      comment: review['comment'],
                      date: review['date'],
                      reviewerName: review['reviewerName']))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}



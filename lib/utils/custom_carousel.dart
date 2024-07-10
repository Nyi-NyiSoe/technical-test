import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technicaltest/models/Product.dart';
import 'package:technicaltest/utils/custom_image_builder.dart';
import 'package:technicaltest/utils/providers.dart';

class CustomCarouselImage extends StatelessWidget {
  const CustomCarouselImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final imgCount = ref.watch(imagCountProvider);
      return Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Card(
                child: CarouselSlider.builder(
                  itemCount: product.imageUrl!.length,
                  itemBuilder: (context, index, realIndex) {
                    return CustomImageBuilder(
                      url: product.imageUrl![index],
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      ref.read(imagCountProvider.notifier).state = index +1;
                    },
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                ),
              )),
          Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  child: Text(
                '$imgCount/${product.imageUrl!.length},',style: Theme.of(context).textTheme.labelMedium,
              )),
            ),
          )
        ],
      );
    });
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:technicaltest/models/Product.dart';
import 'package:technicaltest/utils/custom_image_builder.dart';
class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Card(
                  child: CarouselSlider.builder(
                      itemCount: product.imageUrl!.length,
                      itemBuilder: (context, index, realIndex) {
                        return CustomImageBuilder(url: product.imageUrl![index]);
                      },
                      options: CarouselOptions(
                        autoPlay: false,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        autoPlayInterval: const Duration(seconds: 3),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


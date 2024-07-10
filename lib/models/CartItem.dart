import 'package:technicaltest/models/Product.dart';

class CartItem{
  final Product product;
   int quantity;

  CartItem({required this.product,  this.quantity = 1});

  double get total => product.price! * quantity;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'] ?? 0,
    );
  }

}
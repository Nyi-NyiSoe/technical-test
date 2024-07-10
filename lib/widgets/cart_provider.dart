import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technicaltest/models/CartItem.dart';
import 'package:technicaltest/models/Product.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    if (state.any((item) => item.product.id == product.id)) {
      state = state.map((item) {
        if (item.product.id == product.id) {
          return CartItem(product: item.product, quantity: item.quantity + 1);
        }
        return item;
      }).toList();
      return;
    }
    state = [...state, CartItem(product: product)];
  }

  void deleteFromCart(Product product) {
    if (state.any((item) => item.product.id == product.id)) {
      state = state.map((item) {
        if (item.product.id == product.id && item.quantity > 1) {
          return CartItem(product: item.product, quantity: item.quantity - 1);
        }
        return item;
      }).toList();
      return;
    }
    state = [...state, CartItem(product: product)];
  }

  void removeFromCart(Product product) {
    state = state.where((item) => item.product.id != product.id).toList();
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice {
    return state.fold(
        0, (total, item) => total + (item.product.price! * item.quantity));
  }
}

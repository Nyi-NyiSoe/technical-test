import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technicaltest/models/Product.dart';

const String url = 'https://dummyjson.com/products/category/';
final http.Client client = http.Client();
List<Product> productList = [];
Future<List<Product>> getProducts(String productName) async {
  try {
    final response = await client.get(Uri.parse(url + productName));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      productList = List<Product>.from(data.map((x) => Product.fromJson(x)));
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print(e.toString());
  }
  return [];
}

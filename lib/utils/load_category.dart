import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technicaltest/models/Category.dart';

const String url = 'https://dummyjson.com/products/categories';
final http.Client client = http.Client();
List<Category> categories = [];
Future<List<Category>> getCategories() async {
  try {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      categories = List<Category>.from(data.map((x) => Category.fromJson(x)));
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  } catch (e) {
    print(e.toString());
  }
  return [];
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:technicaltest/models/Product.dart';


final http.Client client = http.Client();
List<Product> productList = [];
Future<List<Product>> getProducts(String url) async {
  try {
    final response = await client.get(Uri.parse(url ));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      productList = List<Product>.from(data['products'].map((x) => Product.fromJson(x)));
      
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  } on SocketException catch (e) {
    Fluttertoast.showToast(
        msg: "No Internet connection: ${e.message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  } on http.ClientException catch (e) {
     Fluttertoast.showToast(
        msg: "HTTP error: ${e.message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  } catch (e) {
    print(e.toString());
  }
  return [];
}

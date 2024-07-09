import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('P r o d u c t s'),
        backgroundColor: Colors.blue,
        actions: [],
      ),
      body: const Center(
        child: Text('Product List Page'),
      ),
    ));
  }
}

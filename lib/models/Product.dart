class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Map<String, double> dimensions;
  final String warrantyInfo;
  final String shipingInfo;
  final String availableStatus;
  final Map<String, String> reviews;
  final String returnPolicy;
  final String minimumOrderQuantity;
  final Map<String, String> meta;
  final String imageUrl;
  final String thumbnailUrl;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.tags,
      required this.brand,
      required this.sku,
      required this.weight,
      required this.dimensions,
      required this.warrantyInfo,
      required this.shipingInfo,
      required this.availableStatus,
      required this.reviews,
      required this.returnPolicy,
      required this.minimumOrderQuantity,
      required this.meta,
      required this.imageUrl,
      required this.thumbnailUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        price: json['price'],
        discountPercentage: json['discountPercentage'],
        rating: json['rating'],
        stock: json['stock'],
        tags: json['tags'],
        brand: json['brand'],
        sku: json['sku'],
        weight: json['weight'],
        dimensions: json['dimensions'],
        warrantyInfo: json['warrantyInfo'],
        shipingInfo: json['shipingInfo'],
        availableStatus: json['availableStatus'],
        reviews: json['reviews'],
        returnPolicy: json['returnPolicy'],
        minimumOrderQuantity: json['minimumOrderQuantity'],
        meta: json['meta'],
        imageUrl: json['imageUrl'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}

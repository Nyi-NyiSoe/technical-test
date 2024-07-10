class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final double? weight;
  final Map<dynamic, dynamic>? dimensions;
  final String? warrantyInfo;
  final String? shippingInfo;
  final String? availableStatus;
  final List<dynamic>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Map<String, dynamic>? meta;
  final List<dynamic>? imageUrl;
  final String? thumbnailUrl;

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
      required this.shippingInfo,
      required this.availableStatus,
      required this.reviews,
      required this.returnPolicy,
      required this.minimumOrderQuantity,
      required this.meta,
      required this.imageUrl,
      required this.thumbnailUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'] ?? 0.0,
      discountPercentage: (json['discountPercentage'] is int)
          ? (json['discountPercentage'] as int).toDouble()
          : json['discountPercentage'] ?? 0.0,
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : json['rating'] ?? 0.0,
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags']) ?? [],
      brand: json['brand'] ?? '-',
      sku: json['sku'] ?? '',
      weight: (json['weight'] is int)
          ? (json['weight'] as int).toDouble()
          : json['weight'] ?? 0.0,
      dimensions: json['dimensions'].map<dynamic, dynamic>(
              (key, value) => MapEntry(key, value.toDouble())) ??
          {},
      warrantyInfo: json['warrantyInformation'] ?? '',
      shippingInfo: json['shippingInformation'] ?? '',
      availableStatus: json['availabilityStatus'] ?? '',
      reviews: List<dynamic>.from(json['reviews']) ?? [],
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      meta: Map<String, String>.from(json['meta']) ?? {},
      imageUrl: List<dynamic>.from(json['images']) ?? [],
      thumbnailUrl: json['thumbnail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discount percentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions,
      'warranty information': warrantyInfo,
      'shipping information': shippingInfo,
      'available status': availableStatus,
      'reviews': reviews,
      'return policy': returnPolicy,
      'minimumOrder quantity': minimumOrderQuantity,
      'meta': meta,
      'images': imageUrl,
      'thumbnail': thumbnailUrl,
    };
  }
}

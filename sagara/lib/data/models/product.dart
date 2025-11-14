enum ProductCondition { newItem, used }

class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final String location;
  final String category;
  final ProductCondition condition;
  final DateTime postedAt;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.category,
    required this.condition,
    required this.postedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      location: json['location'] as String? ?? 'Tidak diketahui',
      category: json['category'] as String? ?? 'Lainnya',
      condition: _parseCondition(json['condition'] as String?),
      postedAt: _parseDate(json['postedAt'] as String?) ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'location': location,
      'category': category,
      'condition': condition.name,
      'postedAt': postedAt.toIso8601String(),
    };
  }

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? description,
    String? imageUrl,
    String? location,
    String? category,
    ProductCondition? condition,
    DateTime? postedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      category: category ?? this.category,
      condition: condition ?? this.condition,
      postedAt: postedAt ?? this.postedAt,
    );
  }

  String get conditionLabel =>
      condition == ProductCondition.newItem ? 'Baru' : 'Bekas';
}

ProductCondition _parseCondition(String? raw) {
  switch (raw?.toLowerCase()) {
    case 'baru':
    case 'new':
      return ProductCondition.newItem;
    case 'bekas':
    case 'used':
      return ProductCondition.used;
    default:
      return ProductCondition.newItem;
  }
}

DateTime? _parseDate(String? raw) {
  if (raw == null || raw.isEmpty) {
    return null;
  }
  return DateTime.tryParse(raw);
}

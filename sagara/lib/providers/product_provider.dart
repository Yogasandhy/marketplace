import 'package:flutter/foundation.dart';

import 'package:sagara/data/models/product.dart';
import 'package:sagara/utils/dummy_products.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider() {
    _products = dummyProducts.map(Product.fromJson).toList();
  }

  late List<Product> _products;

  List<Product> get products => List.unmodifiable(_products);
}

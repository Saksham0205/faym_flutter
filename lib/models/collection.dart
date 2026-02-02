import 'product.dart';

class Collection {
  final String id;
  final String title;
  final List<Product> products;

  Collection({
    required this.id,
    required this.title,
    required this.products,
  });
}

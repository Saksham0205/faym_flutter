import 'package:flutter/material.dart';
import '../models/collection.dart';
import '../models/product.dart';
import '../widgets/collection_card.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  int? expandedIndex;
  late List<Collection> collections;

  @override
  void initState() {
    super.initState();
    _initializeCollections();
  }

  /// Initialize sample collections with product data
  void _initializeCollections() {
    collections = List.generate(10, (collectionIndex) {
      final collectionNumber = collectionIndex + 1;
      // Generate 5-8 products per collection
      final productCount = 5 + (collectionIndex % 4);
      
      return Collection(
        id: 'collection_$collectionNumber',
        title: 'Collection $collectionNumber',
        products: List.generate(productCount, (productIndex) {
          final productNumber = productIndex + 1;
          final imageId = (collectionNumber * 100) + productNumber;
          return Product(
            id: 'product_${collectionNumber}_$productNumber',
            imageUrl: 'https://picsum.photos/200/200?random=$imageId',
          );
        }),
      );
    });
  }

  /// Handle tapping on a collection card
  void _onCollectionTap(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        title: const Text(
          'Collections',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor:Color(0xffFEFEFE),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          return CollectionCard(
            collection: collections[index],
            isExpanded: expandedIndex == index,
            onTap: () => _onCollectionTap(index),
          );
        },
      ),
    );
  }
}

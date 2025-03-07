import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_app/features/products_info/domain/usecase/product_usecase.dart';

class ProductHomePage extends ConsumerStatefulWidget {
  const ProductHomePage({super.key});

  @override
  ConsumerState<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends ConsumerState<ProductHomePage> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(productUsecaseProvider).getProductCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

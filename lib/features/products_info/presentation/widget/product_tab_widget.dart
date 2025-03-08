import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_app/features/products_info/presentation/controller/product_controller.dart';

class ProductTabWidget extends ConsumerWidget {
  const ProductTabWidget({
    super.key,
    required this.onProductTabClicked,
  });
  final Function(String) onProductTabClicked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);
    final categories = productState.productCategories;
    if (categories.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return DefaultTabController(
      length: categories.length,
      child: TabBar(
        onTap: (index) {
          onProductTabClicked(categories[index].slug);
        },
        isScrollable: true,
        tabs: categories.map((category) {
          return Tab(
            text: category.name,
          );
        }).toList(),
      ),
    );
  }
}

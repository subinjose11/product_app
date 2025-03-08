import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_app/features/products_info/domain/enums/product_status.dart';
import 'package:product_app/features/products_info/presentation/controller/product_controller.dart';
import 'package:product_app/features/products_info/presentation/widget/product_tab_widget.dart';

class ProductHomePage extends ConsumerStatefulWidget {
  const ProductHomePage({super.key});

  @override
  ConsumerState<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends ConsumerState<ProductHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(productProvider.notifier).getProductCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productStatus =
        ref.watch(productProvider.select((value) => value.productStatus));
    final productCategoryStatus = ref
        .watch(productProvider.select((value) => value.productCategoryStatus));
    final products = ref.watch(productProvider).categoryProductMap;
    final selectedCategory = ref.watch(productProvider).selectedCategory;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            if (productCategoryStatus == ProductCategoryStatus.loading)
              const Center(child: CircularProgressIndicator()),
            if (productCategoryStatus == ProductCategoryStatus.failed)
              const Text("Couldnt fetch the product"),
            if (productCategoryStatus ==
                ProductCategoryStatus.productCategoryFetched)
              ProductTabWidget(onProductTabClicked: (productCategory) {
                ref
                    .read(productProvider.notifier)
                    .onProductCategoryTabClicked(productCategory);
              }),
            Expanded(
                child: Column(
              children: [
                if (productStatus == ProductStatus.productLoading)
                  const Expanded(
                      child: Center(child: CircularProgressIndicator())),
                if (productStatus == ProductStatus.productFetchingFailed)
                  const Expanded(
                      child: Center(child: Text("Couldn't fetch the product"))),
                if (productStatus == ProductStatus.productFetched)
                  Expanded(
                      child: ListView.builder(
                    itemCount: products[selectedCategory]!.length,
                    itemBuilder: (context, index) {
                      return Text(products[selectedCategory]?[index].title?.toString() ?? 'No title');
                    },
                  ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

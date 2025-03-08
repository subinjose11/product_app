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
    Future.microtask(() {
      ref.read(productProvider.notifier).getProductCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final productStatus =
        ref.watch(productProvider.select((value) => value.productStatus));
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            if (productStatus == ProductStatus.loading)
              const Center(child: CircularProgressIndicator()),
            if (productStatus == ProductStatus.failed)
              const Text("Couldnt fetch the product"),
            if (productStatus == ProductStatus.productFetched)
                ProductTabWidget(onProductTabClicked:(product){
                  print(product);
                }),
          ],
        ),
      ),
    );
  }
}

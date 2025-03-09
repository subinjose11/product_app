import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_app/core/provider/common_provider.dart';
import 'package:product_app/features/products_info/domain/enums/product_status.dart';
import 'package:product_app/features/products_info/presentation/controller/product_controller.dart';
import 'package:product_app/features/products_info/presentation/widget/product_tab_widget.dart';
import 'package:product_app/features/products_info/presentation/widget/products_grid_card.dart';

class ProductHomePage extends ConsumerStatefulWidget {
  const ProductHomePage({super.key});

  @override
  ConsumerState<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends ConsumerState<ProductHomePage> {
  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productProvider);
    final productStatus = productState.productStatus;
    final productCategoryStatus = productState.productCategoryStatus;
    final selectedCategory = productState.selectedCategory;
    final products = productState.categoryProductMap[selectedCategory] ?? [];
    final searchTextValue = ref.watch(searchTextValueProvider);
    final filteredProduct = products
        .where((item) => item.title
            .toString()
            .toLowerCase()
            .contains(searchTextValue.toLowerCase()))
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (productCategoryStatus == ProductCategoryStatus.loading)
              const Expanded(child: Center(child: CircularProgressIndicator())),
            if (productCategoryStatus == ProductCategoryStatus.failed)
              const Expanded(
                  child: Center(
                      child: Text("Something went wrong. Please try again."))),
            if (productCategoryStatus ==
                ProductCategoryStatus.productCategoryFetched)
              ProductTabWidget(onProductTabClicked: (category) {
                ref.invalidate(searchTextValueProvider);
                _searchController.text = '';
                ref
                    .read(productProvider.notifier)
                    .onProductCategoryTabClicked(category);
              }),
            if (productCategoryStatus != ProductCategoryStatus.loading)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
                  child: Builder(
                    builder: (context) {
                      if (productStatus == ProductStatus.productLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (productStatus ==
                          ProductStatus.productFetchingFailed) {
                        return const Center(
                            child: Text("Couldn't fetch the product"));
                      } else if (productStatus ==
                          ProductStatus.productFetched) {
                        return Column(
                          children: [
                            CupertinoSearchTextField(
                              placeholder: 'Search in "$selectedCategory"',
                              controller: _searchController,

                              onChanged: (String value) {
                                ref
                                    .read(searchTextValueProvider.notifier)
                                    .state = value;
                              },
                            ),
                            const SizedBox(height: 12),
                            filteredProduct.isNotEmpty
                                ? Expanded(
                                    child: ProductsGridCard(
                                        products: filteredProduct))
                                : Text(
                                    'No results found for "${_searchController.text}"',
                                    textAlign: TextAlign.center,
                                  ),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

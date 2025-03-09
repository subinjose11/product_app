import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_app/features/products_info/data/models/product_model.dart';
import 'package:product_app/features/products_info/presentation/page/product_preview.dart';
import 'package:product_app/features/products_info/presentation/widget/product_price_details.dart';

class ProductsGridCard extends StatelessWidget {
  final List<Product> products;

  const ProductsGridCard({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPreview(
                  product: products[index],
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: products[index].thumbnail.toString(),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.image_not_supported, size: 50),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        products[index].title!.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      FittedBox(
                        child: ProductPriceDetails(
                            price: products[index].price!,
                            discountPercentage: products[index].discountPercentage!),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      products[index].rating!.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_app/core/constants/constants.dart';
import 'package:product_app/features/products_info/data/models/product_model.dart';
import 'package:product_app/features/products_info/presentation/widget/product_price_details.dart';
import 'package:product_app/features/products_info/presentation/widget/review_widget.dart';
import 'package:product_app/features/products_info/presentation/widget/star_rating_widget.dart';
import 'package:product_app/features/products_info/presentation/widget/stock_shipment_widget.dart';

class ProductPreview extends StatelessWidget {
  final Product product;
  const ProductPreview({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title.toString(), style: size16B),
              const SizedBox(height: 4),
              Row(
                children: [
                  StarRating(rating: product.rating!),
                  const SizedBox(width: 8),
                  Text(product.rating.toString()),
                ],
              ),
              SizedBox(
                height: 300,
                child: PageView.builder(
                  onPageChanged: (index) {},
                  itemCount: product.images!.length,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: product.images![index].toString(),
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.image_not_supported, size: 100),
                      ),
                    );
                  },
                ),
              ),
              // Page indicator dots
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    product.images!.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ),
              ProductPriceDetails(
                price: product.price!,
                discountPercentage: product.discountPercentage!,
              ),
              const SizedBox(height: 8),
              StockShipmentWidget(
                stock: product.stock!.toString(),
                shippingInformation: product.shippingInformation!,
              ),
              const SizedBox(height: 4),
              Text(
                product.warrantyInformation!,
                style: size14,
              ),
              Text(
                product.returnPolicy!,
                style: size14,
              ),
              const SizedBox(height: 8),
              Text("Description", style: size16),
              Text(product.description.toString()),
              const SizedBox(height: 8),
              Text("Reviews from customers", style: size16),
              const SizedBox(height: 6),
              ReviewWidget(reviews: product.reviews!),
            ],
          ),
        ),
      ),
    );
  }
}

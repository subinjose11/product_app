import 'package:flutter/material.dart';

class ProductPriceDetails extends StatelessWidget {
  final double price;
  final double discountPercentage;
  final String currencySymbol;

  const ProductPriceDetails({
    super.key,
    required this.price,
    required this.discountPercentage,
    this.currencySymbol = '₹',
  });

  double get discountedPrice {
    return price * (1 - discountPercentage / 100)*89;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$currencySymbol${discountedPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${discountPercentage.toStringAsFixed(1)}% OFF',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        // Second row: Original price with strikethrough
        const SizedBox(height: 4),
        Row(
          children: [
            const Text("M.R.P "),
            Text(
              '$currencySymbol${(price*80).toStringAsFixed(2)}',
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 14,
              ),
            ),
            const Text(" (Incl. of all taxes)"),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class StockShipmentWidget extends StatelessWidget {
  final String stock;
  final String shippingInformation;
  const StockShipmentWidget(
      {super.key, required this.stock, required this.shippingInformation});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$stock Stocks left',
          style: TextStyle(
            color: Colors.blue.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 16,
          width: 1,
          color: Colors.grey.shade400,
        ),
        const SizedBox(width: 8),
        Text(
          shippingInformation,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

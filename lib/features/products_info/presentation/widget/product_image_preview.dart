import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImagePreview extends StatefulWidget {
  final List<String> images;
  const ProductImagePreview({super.key, required this.images});

  @override
  State<ProductImagePreview> createState() => _ProductImagePreviewState();
}

class _ProductImagePreviewState extends State<ProductImagePreview> {
  int SelectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                SelectedImageIndex = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: widget.images[index].toString(),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: SelectedImageIndex==index?Colors.grey.shade500:Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

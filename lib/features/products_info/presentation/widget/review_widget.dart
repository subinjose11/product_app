import 'package:flutter/material.dart';
import 'package:product_app/core/utils/utils.dart';
import 'package:product_app/features/products_info/data/models/product_model.dart';
import 'package:product_app/features/products_info/presentation/widget/star_rating_widget.dart';

class ReviewWidget extends StatelessWidget {
  final List<Review> reviews;
  const ReviewWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: 6);
        },
        shrinkWrap: true,
        itemCount: reviews.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StarRating(
                  activeColor: Colors.yellow.shade900,
                  rating: reviews[index].rating!.toDouble()),
              Text(
                "${reviews[index].reviewerName!} posted on ${Utils().formatDateFromIso(reviews[index].date!)}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
              ),
              Text(reviews[index].comment!),
            ],
          );
        });
  }
}

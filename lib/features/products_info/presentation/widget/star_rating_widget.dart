import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color activeColor;
  final Color inactiveColor;
  final int starCount;
  final double spacing;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 20,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.starCount = 5,
    this.spacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        // Convert to 1-based index for readability (stars 1-5 instead of 0-4)
        final starPosition = index + 1;

        if (starPosition <= rating.floor()) {
          // Full stars - any complete stars before the decimal point
          return _buildStar(context, 1.0, index);
        } else if (starPosition == rating.floor() + 1 && rating % 1 > 0) {
          // Partial star - the star after the last full star
          // The fill amount is exactly the decimal portion
          return _buildStar(context, rating % 1, index);
        } else {
          // Empty stars - any remaining stars
          return _buildStar(context, 0.0, index);
        }
      }),
    );
  }

  Widget _buildStar(BuildContext context, double fillPercent, [int? position]) {
    final rightPadding = position != null && position < starCount - 1 ? spacing : 0.0;

    if (fillPercent >= 1.0) {
      // Completely filled star
      return Padding(
        padding: EdgeInsets.only(right: rightPadding),
        child: Icon(
          Icons.star,
          color: activeColor,
          size: size,
        ),
      );
    } else if (fillPercent > 0.0) {
      // Partially filled star
      return Padding(
        padding: EdgeInsets.only(right: rightPadding),
        child: Stack(
          children: [
            // Base grey star
            Icon(
              Icons.star,
              color: inactiveColor,
              size: size,
            ),
            // Colored portion of the star
            ClipRect(
              clipper: _StarClipper(part: fillPercent),
              child: Icon(
                Icons.star,
                color: activeColor,
                size: size,
              ),
            ),
          ],
        ),
      );
    } else {
      // Empty star
      return Padding(
        padding: EdgeInsets.only(right: rightPadding),
        child: Icon(
          Icons.star,
          color: inactiveColor,
          size: size,
        ),
      );
    }
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double part;

  _StarClipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * part, size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return oldClipper.part != part;
  }
}
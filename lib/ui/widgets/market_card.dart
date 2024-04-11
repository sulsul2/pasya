import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class MarketCard extends StatelessWidget {
  const MarketCard(
      {super.key,
      required this.width,
      required this.height,
      required this.name,
      required this.photoUrl,
      required this.onPressed});

  final double width;
  final double height;
  final String name;
  final String photoUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: blueColor.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: width == 120 ? 100 : 140,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              name,
              style: blackText,
            )
          ],
        ),
      ),
    );
  }
}

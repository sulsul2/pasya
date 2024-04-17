import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/custom_tab.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(
      {super.key,
      required this.name,
      required this.rating,
      this.profilUrl,
      required this.description});

  final String name;
  final double rating;
  final String? profilUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: blueColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Visibility(
                    visible: profilUrl != null,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profilUrl ?? ""),
                        backgroundColor: greyColor,
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style:
                        blackText.copyWith(fontSize: 16, fontWeight: semibold),
                  ),
                ],
              ),
              CustomTab(
                text: '${rating.toStringAsFixed(1)}/5',
                color: yellowColor,
                padding: 16,
                icon: const Icon(
                  Icons.star_rounded,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(description)
        ],
      ),
    );
  }
}

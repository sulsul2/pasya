import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard(
      {super.key, required this.name, required this.price, required this.time});

  final String name;
  final String price;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: blueColor.withOpacity(0.5), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name ($price)',
                style: blackText.copyWith(fontWeight: semibold, fontSize: 16),
              ),
              Text(
                'Estimasi tiba $time menit',
                style: blackText,
              )
            ],
          ),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: blueColor,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

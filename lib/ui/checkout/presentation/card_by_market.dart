import 'package:flutter/material.dart';

import '../data/checkout_model.dart';
import 'checkout_card.dart';

class CardByMarket extends StatefulWidget {
  final String title;
  final List<CheckoutCardModel> checkoutCards;
  final ValueChanged<int> onTotalPriceChanged;

  const CardByMarket({super.key, 
    required this.title,
    required this.checkoutCards,
    required this.onTotalPriceChanged,
  });

  @override
  _CardByMarketState createState() => _CardByMarketState();
}
class _CardByMarketState extends State<CardByMarket> {
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.yellow, // replace with your color variable
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600, // replace with your text style
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ...widget.checkoutCards.map((card) => CheckoutCard(
          photoUrl: card.photoUrl,
          name: card.name,
          price: card.price,
          count: card.count,
          opacity: card.opacity,
          onTotalPriceChanged: (int value) {
           print(value);
          },
        )),
      ],
    );
  }
}
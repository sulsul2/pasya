import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard(
      {super.key,
      required this.name,
      required this.isSaldo,
      required this.saldo,
      required this.isCheck});

  final String name;
  final bool isSaldo;
  final String saldo;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.shopping_bag,
                        color: whiteColor,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    name,
                    style:
                        blackText.copyWith(fontSize: 16, fontWeight: semibold),
                  )
                ],
              ),
              if (isSaldo)
                const SizedBox(
                  height: 8,
                ),
              if (isSaldo)
                Text(
                  'Saldo : Rp $saldo',
                  style: blackText,
                )
            ],
          ),
          Container(
            width: isCheck ? 24 : 0,
            height: 24,
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                color: blueColor,
                size: isCheck ? 14 : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

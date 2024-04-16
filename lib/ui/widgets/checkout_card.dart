import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard(
      {super.key,
      required this.photoUrl,
      required this.name,
      required this.price,
      required this.count,
      this.opacity = false});

  final String photoUrl;
  final String name;
  final int price;
  final int count;
  final bool opacity;

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
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                photoUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: blackText.copyWith(fontSize: 16, fontWeight: bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('Rp $price/kg',
                  style: blueText.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: 184,
                height: 32,
                decoration: BoxDecoration(
                    color: opacity ? whiteColor.withOpacity(0.5) : whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(
                        color: blueColor.withOpacity(0.5), width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 32,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: opacity
                            ? yellowColor.withOpacity(0.4)
                            : yellowColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: blueColor,
                          size: 16,
                        ),
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: blackText,
                    ),
                    Container(
                      width: 32,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: opacity
                            ? yellowColor.withOpacity(0.4)
                            : yellowColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: blueColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

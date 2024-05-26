import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

import '../../../providers/currency_format.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    super.key,
    required this.photoUrl,
    required this.name,
    required this.price,
    required this.count,
    this.opacity = false, required this.onTotalPriceChanged,
  });

  final String photoUrl;
  final String name;
  final int price;
  final int count;
  final bool opacity;
  final ValueChanged<int> onTotalPriceChanged;

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  void decreaseCount() {
    setState(() {
      if (count > 1) {
        count--;
        widget.onTotalPriceChanged(count );
      }
    });
  }

  void increaseCount() {
    setState(() {
      count++;
      widget.onTotalPriceChanged(count);
    });
  }

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
                widget.photoUrl,
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
                widget.name,
                style: blackText.copyWith(fontSize: 16, fontWeight: bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('${CurrencyFormat.convertToIdr(widget.price, 2)}/kg',
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
                    color: widget.opacity ? whiteColor.withOpacity(0.5) : whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(
                        color: blueColor.withOpacity(0.5), width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: decreaseCount,
                      child: Container(
                        width: 32,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: widget.opacity
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
                    ),
                    Text(
                      count.toString(),
                      style: blackText,
                    ),
                    InkWell(
                      onTap: increaseCount,
                      child: Container(
                        width: 32,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: widget.opacity
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

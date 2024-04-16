import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard(
      {super.key,
      required this.photoUrl,
      this.status = false,
      required this.name,
      required this.price,
      required this.count});

  final String photoUrl;
  final bool status;
  final String name;
  final int price;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: status ? yellowColor : whiteColor,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                    color: blueColor.withOpacity(0.5), width: status ? 0 : 1)),
            child: Center(
              child: Icon(
                Icons.check,
                color: status ? blueColor : blueColor.withOpacity(0.5),
                size: 20.0,
              ),
            ),
          ),
          Container(
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
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: blackText.copyWith(fontSize: 16, fontWeight: bold),
                    ),
                    Text('Rp $price/kg',
                        style: blueText.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        )),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 140,
                      height: 32,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          border: Border.all(
                              color: blueColor.withOpacity(0.5), width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 32,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: yellowColor,
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
                              color: yellowColor,
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
          )
        ],
      ),
    );
  }
}

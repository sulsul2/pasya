import 'package:flutter/material.dart';
import 'package:pasya/ui/cart/data/cart_model.dart';
import 'package:pasya/ui/cart/data/cart_provider.dart';
import 'package:pasya/theme.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => {cartProvider.changeStatusCart(cartModel.id)},
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: cartModel.status ? yellowColor : whiteColor,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: blueColor.withOpacity(0.5),
                      width: cartModel.status ? 0 : 1)),
              child: Center(
                child: Icon(
                  Icons.check,
                  color:
                      cartModel.status ? blueColor : blueColor.withOpacity(0.5),
                  size: 20.0,
                ),
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
                      cartModel.photoUrl,
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
                      cartModel.name,
                      style: blackText.copyWith(fontSize: 16, fontWeight: bold),
                    ),
                    Text('Rp ${cartModel.price}/kg',
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
                          GestureDetector(
                            onTap: () {
                              cartProvider.chageCount(cartModel.id, false);
                            },
                            child: Container(
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
                          ),
                          Text(
                            cartModel.count.toString(),
                            style: blackText,
                          ),
                          GestureDetector(
                            onTap: () {
                              cartProvider.chageCount(cartModel.id, true);
                            },
                            child: Container(
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

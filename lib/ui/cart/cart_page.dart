import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/cart/data/cart_provider.dart';
import 'package:pasya/ui/cart/presentation/cart_card.dart';
import 'package:pasya/ui/checkout/checkout_page.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:provider/provider.dart';

import '../../providers/currency_format.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Widget bottomNav() {
      return SafeArea(
        child: Container(
            width: double.infinity,
            height: 184,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 8),
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36), topRight: Radius.circular(36)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: greyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 52, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ambil', style: blackText),
                            ],
                          ),
                        )),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: yellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 52, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Antar', style: blackText),
                            ],
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Pembayaran',
                          style: whiteText.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(cartProvider.totalPrice, 2),
                          style: whiteText.copyWith(
                              fontSize: 24, fontWeight: bold),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckoutPage(price:cartProvider.totalPrice)),
                            ),
                        style: TextButton.styleFrom(
                          backgroundColor: yellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Checkout',
                                  style: blackText.copyWith(
                                      fontSize: 16, fontWeight: semibold)),
                            ],
                          ),
                        )),
                  ],
                )
              ],
            )),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Toko A',
                  style: blackText.copyWith(fontWeight: semibold, fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                // ListView.builder(
                //   itemCount: cartProvider.cartList.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     final cartItem = cartProvider.cartList[index];
                //     return CartCard(
                //       cartModel: cartItem,
                //     );
                //   },
                // ),
                Column(
                  children: cartProvider.cartList
                      .map((e) => CartCard(cartModel: e))
                      .toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: bottomNav(),
      body: Stack(children: [
        const Header(
          text: 'Keranjang Anda',
          back: true,
        ),
        content(),
      ]),
    );
  }
}

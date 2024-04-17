import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/productSeller/product_seller_page.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';

class ShopSellerPage extends StatelessWidget {
  const ShopSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 120),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.9,
            ),
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return MarketCard(
                width: 160,
                height: 184,
                name: 'Pasar A',
                photoUrl: 'assets/pasar_ex.png',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductSellerPage()),
                ),
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          content(),
          const Header(
            text: 'Toko',
          ),
        ],
      ),
    );
  }
}

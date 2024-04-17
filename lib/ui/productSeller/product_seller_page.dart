import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/detailMarket/detail_market_page.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';

class ProductSellerPage extends StatelessWidget {
  const ProductSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 120),
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                name: 'Daging Premium',
                photoUrl: 'assets/ayam_mentah.png',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailMarketPage()),
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
            text: 'Produk',
            add: true,
          ),
        ],
      ),
    );
  }
}

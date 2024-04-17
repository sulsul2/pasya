// import 'package:carousel_indicator/carousel_indicator.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
// import 'package:pasya/ui/pages/customer_page_second.dart';
import 'package:pasya/ui/detailProduct/detail_product_page.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';
// import 'package:scroll_page_view/pager/page_controller.dart';
// import 'package:scroll_page_view/pager/scroll_page_view.dart';

class DetailShopPage extends StatefulWidget {
  const DetailShopPage({super.key});

  @override
  State<DetailShopPage> createState() => _DetailShopPageState();
}

class _DetailShopPageState extends State<DetailShopPage> {
  @override
  Widget build(BuildContext context) {
    Widget contentPicture() {
      return Container(
        margin: const EdgeInsets.only(top: 120),
        width: double.infinity,
        height: 280,
        child: Image.asset(
          'assets/detail_shop_1.png',
          fit: BoxFit.cover,
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 342),
        padding: const EdgeInsets.only(top: 24, right: 20, left: 20),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(36), topRight: Radius.circular(36))),
        child: Column(
          children: [
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
              style: blackText,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.9,
              ),
              itemCount: 13,
              itemBuilder: (BuildContext context, int index) {
                return MarketCard(
                  width: 160,
                  height: 184,
                  name: 'Daging Ayam Paha',
                  photoUrl: 'assets/detail_shop_2.png',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailProductPage()),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            contentPicture(),
            const Header(
              text: 'Toko A',
              shop: true,
              back: true,
            ),
            SingleChildScrollView(
              child: content(),
            ),
          ],
        ));
  }
}

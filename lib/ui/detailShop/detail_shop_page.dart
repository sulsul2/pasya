// import 'package:carousel_indicator/carousel_indicator.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/detailProduct/data/product_provider.dart';
// import 'package:pasya/ui/pages/customer_page_second.dart';
import 'package:pasya/ui/detailProduct/detail_product_page.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';
import 'package:provider/provider.dart';

import '../chat/presentation/image_loader.dart';
// import 'package:scroll_page_view/pager/page_controller.dart';
// import 'package:scroll_page_view/pager/scroll_page_view.dart';

class DetailShopPage extends StatefulWidget {
  const DetailShopPage({super.key, required this.id});

  final String id;

  @override
  State<DetailShopPage> createState() => _DetailShopPageState();
}

class _DetailShopPageState extends State<DetailShopPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<ProductProvider>(context, listen: false)
        .getProduct(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Widget contentPicture() {
      return Container(
        margin: const EdgeInsets.only(top: 90),
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
              itemCount: productProvider.productList.length,
              itemBuilder: (BuildContext context, int index) {
                var product = productProvider.productList[index];
                return MarketCard(
                  width: 160,
                  height: 184,
                  name: product.name,
                  photoUrl:
                      'https://cdn.discordapp.com/attachments/838266599348895784/1239629181566976080/martijn-vonk-pCydkpyHMHs-unsplash.jpg?ex=66439e24&is=66424ca4&hm=cf7b813032998e7cc3b2db811518023b5567cbe264f9bbf982924eb947d5d539&',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailProductPage(),
                    ),
                  ), imageLoader: AssetImageLoader(),
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
            SingleChildScrollView(
              child: content(),
            ),
            const Header(
              text: 'Toko A',
              shop: true,
              back: true,
            ),
          ],
        ));
  }
}

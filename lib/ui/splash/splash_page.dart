// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/customerMarket/data/market_provider.dart';
// import 'package:pasya/ui/detailMarket/data/shop_provider.dart';
// import 'package:pasya/ui/detailProduct/data/product_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    final navigator = Navigator.of(context);
    MarketProvider marketProvider =
        Provider.of<MarketProvider>(context, listen: false);
    // ProductProvider productProvider =
    //     Provider.of<ProductProvider>(context, listen: false);
    // ShopProvider shopProvider =
    //     Provider.of<ShopProvider>(context, listen: false);

    await marketProvider.getMarket();
    // await productProvider.getProduct();
    // await shopProvider.getShop(2);
    await navigator.pushNamedAndRemoveUntil('/main', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
          child: Container(
        width: 158,
        height: 154,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          'assets/pasya_logo.png',
        ))),
      )),
    );
  }
}

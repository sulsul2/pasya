// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/detailProduct/data/product_provider.dart';
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
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    await productProvider.getProduct();
    await navigator.pushNamedAndRemoveUntil('/login', (route) => false);
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

// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/customerMarket/data/market_provider.dart';
// import 'package:pasya/ui/detailMarket/data/shop_provider.dart';
// import 'package:pasya/ui/detailProduct/data/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/login_provider.dart';

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

    await marketProvider.getMarket();

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      final payload = decodeToken(token);
      final expiryDate = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);

      if (expiryDate.isAfter(DateTime.now())) {
        // Token is valid, navigate to home page
        await  Navigator.pushNamed(context, "/main");
      } else {
        // Token is expired, navigate to login page
        await navigator.pushNamedAndRemoveUntil('/login', (route) => false);
      }
    } else {
      // No token found, navigate to login page
      await navigator.pushNamedAndRemoveUntil('/login', (route) => false);
    }
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

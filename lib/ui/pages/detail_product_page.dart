import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/header.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget contentPicture() {
      return Container(
        margin: const EdgeInsets.only(top: 120),
        width: double.infinity,
        height: 280,
        child: Image.asset(
          'assets/detail_shop_2.png',
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
          child: Column());
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          contentPicture(),
          const Header(
            text: 'Daging Ayam Paha',
            shop: true,
            back: true,
          ),
          SingleChildScrollView(
            child: content(),
          ),
        ],
      ),
    );
  }
}

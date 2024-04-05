import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class Header extends StatelessWidget {
  final bool back;
  final bool shop;
  final String text;
  final bool add;
  const Header(
      {super.key,
      required this.text,
      this.back = false,
      this.shop = false,
      this.add = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      height: 95,
      padding: const EdgeInsets.only(top: 40, bottom: 14, left: 20, right: 20),
      decoration: BoxDecoration(
        color: blueColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: back ? 40 : 0,
            height: back ? 40 : 0,
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: blueColor,
                size: 24.0,
              ),
            ),
          ),
          Text(
            text,
            style: whiteText.copyWith(fontSize: 24, fontWeight: bold),
          ),
          Container(
            width: shop ? 40 : 0,
            height: shop ? 40 : 0,
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart_rounded,
                color: blueColor,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
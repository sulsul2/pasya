import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/addProduct/add_product_page.dart';
import 'package:pasya/ui/cart/cart_page.dart';

class Header extends StatelessWidget {
  final bool back;
  final bool shop;
  final String text;
  final bool add;
  final String? imageUrl;
  const Header({
    super.key,
    required this.text,
    this.back = false,
    this.shop = false,
    this.add = false,
    this.imageUrl,
  });

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
                size: back ? 24.0 : 0,
              ),
            ),
          ),
          Row(
            children: [
              Visibility(
                visible: imageUrl != null,
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl ?? ""),
                    backgroundColor: greyColor,
                  ),
                ),
              ),
              Text(
                text,
                style: whiteText.copyWith(fontSize: 24, fontWeight: bold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      shop ? const CartPage() : const AddProductPage()),
            ),
            child: Container(
              width: shop || add ? 40 : 0,
              height: shop || add ? 40 : 0,
              decoration: BoxDecoration(
                color: yellowColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Icon(
                  shop ? Icons.shopping_cart_rounded : Icons.add,
                  color: blueColor,
                  size: shop || add ? 24.0 : 0,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

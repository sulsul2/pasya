import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/custom_tab.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/order/presentation/order_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        margin: const EdgeInsets.only(
          top: 120,
        ),
        width: double.infinity,
        decoration: BoxDecoration(color: whiteColor),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTab(
                      text: 'Semua',
                      color: yellowColor,
                      padding: 30,
                    ),
                    CustomTab(
                      text: 'Dikirim',
                      color: greyColor,
                      padding: 30,
                    ),
                    CustomTab(
                      text: 'Selesai',
                      color: greyColor,
                      padding: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Toko A',
                  style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const OrderCard(
                  tipe: 0,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Toko B',
                  style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const OrderCard(
                  tipe: 1,
                ),
                const SizedBox(
                  height: 8,
                ),
                const OrderCard(
                  tipe: 1,
                ),
                const SizedBox(
                  height: 8,
                ),
                const OrderCard(
                  tipe: 1,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [const Header(text: 'Pesanan Anda'), content()],
      ),
    );
  }
}

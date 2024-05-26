import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/custom_tab.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/order/presentation/order_card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int tipe = 0;
  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        margin: const EdgeInsets.only(
          top: 100,
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tipe = 0;
                        });
                      },
                      child: CustomTab(
                        text: 'Semua',
                        color: tipe == 0 ? yellowColor : greyColor,
                        padding: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tipe = 1;
                        });
                      },
                      child: CustomTab(
                        text: 'Dikirim',
                        color: tipe == 1 ? yellowColor : greyColor,
                        padding: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tipe = 2;
                        });
                      },
                      child: CustomTab(
                        text: 'Selesai',
                        color: tipe == 2 ? yellowColor : greyColor,
                        padding: 30,
                      ),
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

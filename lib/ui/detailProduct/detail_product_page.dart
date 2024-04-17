import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/chat/chat_page.dart';
import 'package:pasya/ui/order/order_page.dart';
import 'package:pasya/ui/widgets/condition_tab.dart';
import 'package:pasya/ui/widgets/custom_tab.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/detailProduct/presentation/review_card.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  int _selectedAction = 0;

  @override
  Widget build(BuildContext context) {
    Widget actionNav(int i) {
      return Container(
        width: double.infinity,
        height: 160,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(36), topRight: Radius.circular(36)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  i == 1 ? 'Jumlah Produk' : 'Harga Tawar',
                  style: whiteText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                Container(
                  width: 148,
                  height: 32,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 32,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: yellowColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: blueColor,
                            size: 16,
                          ),
                        ),
                      ),
                      Text(
                        '1',
                        style: blackText,
                      ),
                      Container(
                        width: 32,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: yellowColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: blueColor,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _selectedAction = 0; // Change to 1 for Pesan
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: yellowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        i == 1 ? 'Pesan' : 'Tawar',
                        style: blackText.copyWith(
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );
    }

    Widget bottomNav() {
      if (_selectedAction == 0) {
        return SafeArea(
          child: Container(
            height: 64,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    child: Center(
                      child: Icon(
                        Icons.chat,
                        color: whiteColor,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                VerticalDivider(color: whiteColor),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderPage()),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 20),
                    child: Center(
                      child: Icon(
                        Icons.shopping_cart_rounded,
                        color: whiteColor,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                // VerticalDivider(color: whiteColor),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedAction = 2;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: yellowColor,
                        border: Border(
                          right: BorderSide(
                            color: blueColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Tawar',
                          textAlign: TextAlign.center,
                          style: blackText.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        ),
                      ),
                    ),
                  ),
                ),
                // VerticalDivider(color: whiteColor),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedAction = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: yellowColor,
                      ),
                      child: Center(
                        child: Text(
                          'Pesan',
                          textAlign: TextAlign.center,
                          style: blackText.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (_selectedAction == 1) {
        return actionNav(1);
      } else {
        return actionNav(2);
      }
    }

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
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedAction = 0;
          });
        },
        child: Container(
            margin: const EdgeInsets.only(top: 342),
            padding:
                const EdgeInsets.only(top: 24, right: 20, left: 20, bottom: 16),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp 40.000/Kg',
                      style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                    ),
                    Text(
                      'Jumlah Stok : 40 kg',
                      style: blackText,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTab(
                        text: 'Terjual 1', color: yellowColor, padding: 16),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomTab(
                      text: '5/5',
                      color: yellowColor,
                      padding: 16,
                      icon: const Icon(
                        Icons.star_rounded,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomTab(
                      text: '50',
                      color: yellowColor,
                      padding: 16,
                      icon: const Icon(
                        Icons.chat,
                        size: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
                  style: blackText,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Informasi Produk',
                  style: blackText.copyWith(fontWeight: semibold, fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                const ConditionTab(
                  parameter: 'Kondisi Barang',
                  value: 'Baru',
                ),
                const SizedBox(
                  height: 8,
                ),
                const ConditionTab(
                  parameter: 'Kondisi Barang',
                  value: 'Baru',
                ),
                const SizedBox(
                  height: 8,
                ),
                const ConditionTab(
                  parameter: 'Kondisi Barang',
                  value: 'Baru',
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ulasan Pembeli',
                      style: blackText.copyWith(
                          fontWeight: semibold, fontSize: 16),
                    ),
                    Text(
                      'Lihat Semua',
                      style:
                          blueText.copyWith(fontWeight: semibold, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const ReviewCard(
                  name: 'Hessniya',
                  rating: 2,
                  profilUrl: '',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                )
              ],
            )),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      // bottomNavigationBar: bottomNav(),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bottomNav(),
            ],
          ),
        ],
      ),
    );
  }
}

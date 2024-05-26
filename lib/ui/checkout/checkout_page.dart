import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/payment/payment_page.dart';
import 'package:pasya/ui/widgets/address_card.dart';
import 'package:pasya/ui/widgets/condition_tab.dart';
import 'package:pasya/ui/checkout/presentation/delivery_card.dart';
import 'package:pasya/ui/widgets/header.dart';

import '../../providers/currency_format.dart';
import 'data/checkout_model.dart';
import 'presentation/card_by_market.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool _showDeliveryNav = false;
  bool _blueBackground = false;

  late String hargabarang;
  late List<CardByMarket> cardByMarketList;

  @override
  void initState() {
    super.initState();
    cardByMarketList = [
      CardByMarket(
        title: 'Toko A',
        checkoutCards: [
          CheckoutCardModel(
            photoUrl: 'assets/chicken_farm.png',
            name: 'Daging Ayam 1/2 Kg',
            price: 10000,
            count: 1,
            opacity: false,
          ),
        ],
        onTotalPriceChanged: onTotalPriceChanged,
      ),
    ];

    int totalPrice = 0;
    for (var market in cardByMarketList) {
      for (var item in market.checkoutCards) {
        totalPrice += item.price * item.count;
      }
    }
    hargabarang = CurrencyFormat.convertToIdr(totalPrice, 2);
  }

  void onTotalPriceChanged(int value) {
    int totalPrice = 0;
    for (var market in cardByMarketList) {
      for (var item in market.checkoutCards) {
        totalPrice += item.price * item.count;
      }
    }
    setState(() {
      hargabarang = CurrencyFormat.convertToIdr(totalPrice, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget deliveryNav() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _showDeliveryNav ? 224 : 0,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(36), topRight: Radius.circular(36)),
        ),
        child: _showDeliveryNav
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showDeliveryNav = false;
                      _blueBackground = false;
                    });
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: blueColor,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Pilih kurir',
                  style: blackText.copyWith(
                      fontSize: 20, fontWeight: semibold),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const DeliveryCard(
              name: 'Gojek',
              price: '20.000',
              time: 30,
              icon: true,
              check: true,
            ),
            const SizedBox(
              height: 8,
            ),
            const DeliveryCard(
              name: 'Grab',
              price: '30.000',
              time: 20,
              icon: false,
            )
          ],
        )
            : const SizedBox(),
      );
    }

    Widget content() {
      return GestureDetector(
        onTap: () {
          setState(() {
            _showDeliveryNav = false;
            _blueBackground = false;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: _blueBackground ? blueColor.withOpacity(0.5) : whiteColor,
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alamat Pengiriman',
                    style:
                    blackText.copyWith(fontSize: 16, fontWeight: semibold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AddressCard(
                    title: 'Home',
                    name: 'Rahman Atisura',
                    number: '624556693780',
                    address:
                    'Jl. Ciumbuleuit No.50 - 58, Hegarmanah, Kec. Cidadap, Kota Bandung, Jawa Barat 40141',
                    icon: true,
                    opacity: _blueBackground ? true : false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Keterangan Pesanan',
                    style:
                    blackText.copyWith(fontSize: 16, fontWeight: semibold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Replace hardcoded CardByMarket widgets with map function
                  ...cardByMarketList.map((cardByMarket) => CardByMarket(
                    title: cardByMarket.title,
                    checkoutCards: cardByMarket.checkoutCards,
                    onTotalPriceChanged: (int value) {
                      setState(() {
                        onTotalPriceChanged(value);
                      });
                    },
                  )),
                  Text(
                    'Opsi Pengiriman',
                    style:
                    blackText.copyWith(fontSize: 16, fontWeight: semibold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showDeliveryNav = true;
                        _blueBackground = true;
                      });
                    },
                    child: DeliveryCard(
                      price: '30.000',
                      time: 30,
                      name: 'Gojek',
                      icon: true,
                      opacity: _blueBackground ? true : false,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Ringkasan Belanja',
                    style:
                    blackText.copyWith(fontSize: 16, fontWeight: semibold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ConditionTab(
                    parameter: 'Harga Barang',
                    value: hargabarang,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const ConditionTab(
                      parameter: 'Ongkos Kirim', value: 'Gratis'),
                  const SizedBox(
                    height: 8,
                  ),
                  const ConditionTab(
                      parameter: 'Jasa Aplikasi ', value: 'Gratis'),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: blackText.copyWith(
                                fontSize: 16, fontWeight: semibold),
                          ),
                          Text(
                            hargabarang,
                            style: blackText.copyWith(
                                fontSize: 24, fontWeight: bold),
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentPage(),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: yellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Bayar',
                                  style: blackText.copyWith(
                                      fontSize: 16, fontWeight: semibold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(children: [
        const Header(
          text: 'Checkout',
          back: true,
        ),
        content(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            deliveryNav(),
          ],
        ),
      ]),
    );
  }
}
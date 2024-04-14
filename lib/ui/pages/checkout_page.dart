import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/pages/payment_page.dart';
import 'package:pasya/ui/widgets/address_card.dart';
import 'package:pasya/ui/widgets/checkout_card.dart';
import 'package:pasya/ui/widgets/condition_tab.dart';
import 'package:pasya/ui/widgets/delivery_card.dart';
import 'package:pasya/ui/widgets/header.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 120),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alamat Pengiriman',
                  style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const AddressCard(
                  title: 'Home',
                  name: 'Rahman Atisura',
                  number: '624556693780',
                  address:
                      'Jl. Ciumbuleuit No.50 - 58, Hegarmanah, Kec. Cidadap, Kota Bandung, Jawa Barat 40141',
                  icon: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Keterangan Pesanan',
                  style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    'Toko A',
                    style:
                        blackText.copyWith(fontSize: 16, fontWeight: semibold),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const CheckoutCard(
                    photoUrl: 'assets/chicken_farm.png',
                    name: 'Daging Ayam Paha',
                    price: 40000,
                    count: 2),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    'Toko B',
                    style:
                        blackText.copyWith(fontSize: 16, fontWeight: semibold),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const CheckoutCard(
                    photoUrl: 'assets/ayam_mentah.png',
                    name: 'Daging Ayam Paha',
                    price: 40000,
                    count: 1),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Opsi Pengiriman',
                  style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const DeliveryCard(
                  price: '30.000',
                  time: 30,
                  name: 'Gojek',
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Ringkasan Belanja',
                  style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const ConditionTab(parameter: 'Harga Barang', value: '80.000'),
                const SizedBox(
                  height: 8,
                ),
                const ConditionTab(parameter: 'Ongkos Kirim', value: '20.000'),
                const SizedBox(
                  height: 8,
                ),
                const ConditionTab(parameter: 'Jasa Aplikasi ', value: '1.000'),
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
                          'Rp 110.000',
                          style: blackText.copyWith(
                              fontSize: 24, fontWeight: bold),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentPage()),
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
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      // bottomNavigationBar: bottomNav(),
      body: Stack(children: [
        const Header(
          text: 'Checkout',
          back: true,
        ),
        content(),
      ]),
    );
  }
}

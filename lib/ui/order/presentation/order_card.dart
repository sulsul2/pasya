import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/detailProduct/detail_product_page.dart';
import 'package:pasya/ui/widgets/custom_tab.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.tipe});

  final int tipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: blueColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.asset(
                  'assets/ayam_mentah.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dibeli pada 04-11-2023',
                    style: blueText.copyWith(fontWeight: regular),
                  ),
                  Text(
                    'Daging Ayam Paha',
                    style: blackText.copyWith(fontWeight: bold, fontSize: 16),
                  ),
                  Text(
                    '0.5 Kg',
                    style: blackText.copyWith(fontWeight: regular),
                  ),
                  Text(
                    'Rp 10.000',
                    style: blueText.copyWith(fontWeight: bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          tipe == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTab(text: 'Selesai', color: blueColor, padding: 48),
                    GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailProductPage()),
                            ),
                        child: CustomTab(
                            text: 'Pesan Lagi',
                            color: yellowColor,
                            padding: 48))
                  ],
                )
              : tipe == 1
                  ? CustomTab(
                      text: 'Sedang dalam perjalanan',
                      color: yellowColor,
                      padding: 60)
                  : CustomTab(
                      text: 'Menunggu konfirmasi penjual',
                      color: greyColor,
                      padding: 60),
        ],
      ),
    );
  }
}

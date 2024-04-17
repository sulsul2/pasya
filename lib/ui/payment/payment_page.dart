import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/condition_tab.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/payment/presentation/payment_card.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 120),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: 8,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: yellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: blackText.copyWith(
                            fontSize: 16, fontWeight: semibold),
                      ),
                      Text(
                        'Rp 101.000',
                        style:
                            blackText.copyWith(fontSize: 24, fontWeight: bold),
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Metode Pembayaran',
              style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            // const SizedBox(
            //   height: 8,
            // ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  PaymentCard(
                      name: 'Pasya-Pay',
                      isSaldo: true,
                      saldo: '200.000',
                      isCheck: true),
                  PaymentCard(
                      name: 'Pasya-Pay',
                      isSaldo: true,
                      saldo: '200.000',
                      isCheck: true),
                  PaymentCard(
                      name: 'Pasya-Pay',
                      isSaldo: true,
                      saldo: '200.000',
                      isCheck: true),
                  PaymentCard(
                      name: 'Pasya-Pay',
                      isSaldo: true,
                      saldo: '200.000',
                      isCheck: true),
                  PaymentCard(
                      name: 'Pasya-Pay',
                      isSaldo: true,
                      saldo: '200.000',
                      isCheck: true),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          const Header(
            text: 'Pembayaran',
            back: true,
          ),
          content(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bayar',
                              style: blackText.copyWith(
                                  fontSize: 16, fontWeight: semibold)),
                        ],
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

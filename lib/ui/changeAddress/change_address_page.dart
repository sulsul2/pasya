import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/address_card.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';

class ChangeAddressPage extends StatelessWidget {
  const ChangeAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    Widget content() {
      return Container(
          margin: const EdgeInsets.only(top: 120),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(color: whiteColor),
          child: Column(
            children: [
              FormInput(
                textController: searchController,
                hintText: 'Cari Lokasi',
                label: 'Lokasi',
                isSearch: true,
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: yellowColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Pakai lokasi saat ini',
                            style: blackText.copyWith(
                                fontSize: 16, fontWeight: semibold)),
                      ],
                    ),
                  )),
              // const SizedBox(
              //   height: 16,
              // ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    AddressCard(
                      title: 'Home',
                      name: 'Rahman Atisura',
                      number: '624556693780',
                      address:
                          'Jl. Ciumbuleuit No.50 - 58, Hegarmanah, Kec. Cidadap, Kota Bandung, Jawa Barat 40141',
                      icon: true,
                      check: true,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AddressCard(
                      title: 'Home',
                      name: 'Rahman Atisura',
                      number: '624556693780',
                      address:
                          'Jl. Ciumbuleuit No.50 - 58, Hegarmanah, Kec. Cidadap, Kota Bandung, Jawa Barat 40141',
                      icon: false,
                      // check: true,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AddressCard(
                      title: 'Home',
                      name: 'Rahman Atisura',
                      number: '624556693780',
                      address:
                          'Jl. Ciumbuleuit No.50 - 58, Hegarmanah, Kec. Cidadap, Kota Bandung, Jawa Barat 40141',
                      icon: false,
                      // check: true,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AddressCard(
                      title: 'Home',
                      name: 'Rahman Atisura',
                      number: '624556693780',
                      address:
                          'Jl. Ciumbuleuit No.50 - 58, Hegarmanah, Kec. Cidadap, Kota Bandung, Jawa Barat 40141',
                      icon: false,
                      // check: true,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AddressCard(
                      title: 'Home',
                      name: 'Rahman Atisura',
                      number: '624556693780',
                      address:
                          'Jl. Ciumbuleuit No.50 - 58, Hegarmanah, Kec. Cidadap, Kota Bandung, Jawa Barat 40141',
                      icon: false,
                      // check: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
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
                        Text('Tambah alamat baru',
                            style: blackText.copyWith(
                                fontSize: 16, fontWeight: semibold)),
                      ],
                    ),
                  )),
            ],
          ));
    }

    return Scaffold(
      backgroundColor: whiteColor,
      // bottomNavigationBar: bottomNav(),
      body: Stack(children: [
        const Header(
          text: 'Ubah Alamat',
          back: true,
        ),
        content(),
      ]),
    );
  }
}

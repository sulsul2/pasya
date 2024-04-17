import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/customerMarket/customer_market_page.dart';
import 'package:pasya/ui/detailMarket/detail_market_page.dart';
import 'package:pasya/ui/home/presentation/custom_dropdown.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    const List<String> list = <String>[
      'Bandung',
      'Jakarta',
      'Bogor',
      'Bekasih'
    ];
    Widget content() {
      return Container(
          margin: const EdgeInsets.only(top: 120),
          padding: const EdgeInsets.only(bottom: 15),
          child: ListView(children: [
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const CustomDropDown(
                          list: list,
                          placeholder: 'Pilih Kota',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        FormInput(
                          textController: searchController,
                          hintText: 'Cari toko',
                          label: 'Toko',
                          isSearch: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pasar Tradisional',
                              style: blackText.copyWith(
                                  fontSize: 16, fontWeight: semibold),
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomerMarketPage()),
                              ),
                              child: Text(
                                'Detail',
                                style: blueText.copyWith(
                                    fontSize: 16, fontWeight: semibold),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const SizedBox(
                      width: 20,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Pasar A',
                      photoUrl: 'assets/pasar_ex.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Pasar A',
                      photoUrl: 'assets/pasar_ex.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Pasar A',
                      photoUrl: 'assets/pasar_ex.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Pasar A',
                      photoUrl: 'assets/pasar_ex.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Peternakan',
                        style: blackText.copyWith(
                            fontSize: 16, fontWeight: semibold),
                      ),
                      Text(
                        'Detail',
                        style: blueText.copyWith(
                            fontSize: 16, fontWeight: semibold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const SizedBox(
                      width: 20,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Peternakan A',
                      photoUrl: 'assets/chicken_farm.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Peternakan A',
                      photoUrl: 'assets/chicken_farm.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Peternakan A',
                      photoUrl: 'assets/chicken_farm.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Peternakan A',
                      photoUrl: 'assets/chicken_farm.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Perikanan',
                        style: blackText.copyWith(
                            fontSize: 16, fontWeight: semibold),
                      ),
                      Text(
                        'Detail',
                        style: blueText.copyWith(
                            fontSize: 16, fontWeight: semibold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const SizedBox(
                      width: 20,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Perikanan A',
                      photoUrl: 'assets/chicken_farm.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Perikanan A',
                      photoUrl: 'assets/chicken_farm.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Perikanan A',
                      photoUrl: 'assets/chicken_farm.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Perikanan A',
                      photoUrl: 'assets/chicken_farm.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ]),
                ),
              ],
            ),
          ]));
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            content(),
            const Header(
              text: 'Beranda',
              shop: true,
            ),
          ],
        ));
  }
}

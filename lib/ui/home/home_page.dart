import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/customerMarket/customer_market_page.dart';
import 'package:pasya/ui/customerMarket/data/market_provider.dart';
import 'package:pasya/ui/detailMarket/detail_market_page.dart';
import 'package:pasya/ui/home/presentation/custom_dropdown.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MarketProvider marketProvider = Provider.of<MarketProvider>(context);
    TextEditingController searchController = TextEditingController();
    const List<String> list = <String>[
      'Bandung',
      'Jakarta',
      'Bogor',
      'Bekasih'
    ];
    Widget content() {
      return Container(
          margin: const EdgeInsets.only(top: 100),
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
                                        const CustomerMarketPage(
                                          title: 'Pasar Tradisional',
                                        )),
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
                    ...marketProvider.marketList.map((market) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: MarketCard(
                          width: 120,
                          height: 148,
                          name: market.name,
                          photoUrl: market.image,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailMarketPage(
                                      idMarket: market.id,
                                    )),
                          ),
                        ),
                      );
                    }).toList(),
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
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomerMarketPage(
                                    title: 'Peternakan',
                                  )),
                        ),
                        child: Text(
                          'Detail',
                          style: blueText.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        ),
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
                      photoUrl:
                          'https://cdn.discordapp.com/attachments/838266599348895784/1239629181566976080/martijn-vonk-pCydkpyHMHs-unsplash.jpg?ex=66439e24&is=66424ca4&hm=cf7b813032998e7cc3b2db811518023b5567cbe264f9bbf982924eb947d5d539&',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage(
                                  idMarket: 2,
                                )),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Peternakan A',
                      photoUrl:
                          'https://cdn.discordapp.com/attachments/838266599348895784/1239629181566976080/martijn-vonk-pCydkpyHMHs-unsplash.jpg?ex=66439e24&is=66424ca4&hm=cf7b813032998e7cc3b2db811518023b5567cbe264f9bbf982924eb947d5d539&',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage(
                                  idMarket: 2,
                                )),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Peternakan A',
                      photoUrl:
                          'https://cdn.discordapp.com/attachments/838266599348895784/1239629181566976080/martijn-vonk-pCydkpyHMHs-unsplash.jpg?ex=66439e24&is=66424ca4&hm=cf7b813032998e7cc3b2db811518023b5567cbe264f9bbf982924eb947d5d539&',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage(
                                  idMarket: 2,
                                )),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Peternakan A',
                      photoUrl:
                          'https://cdn.discordapp.com/attachments/838266599348895784/1239629181566976080/martijn-vonk-pCydkpyHMHs-unsplash.jpg?ex=66439e24&is=66424ca4&hm=cf7b813032998e7cc3b2db811518023b5567cbe264f9bbf982924eb947d5d539&',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage(
                                  idMarket: 2,
                                )),
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
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomerMarketPage(
                                    title: 'Perikanan',
                                  )),
                        ),
                        child: Text(
                          'Detail',
                          style: blueText.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        ),
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
                      photoUrl:
                          'https://cdn.discordapp.com/attachments/838266599348895784/1239629181566976080/martijn-vonk-pCydkpyHMHs-unsplash.jpg?ex=66439e24&is=66424ca4&hm=cf7b813032998e7cc3b2db811518023b5567cbe264f9bbf982924eb947d5d539&',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage(
                                  idMarket: 2,
                                )),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Perikanan A',
                      photoUrl:
                          'https://cdn.discordapp.com/attachments/838266599348895784/1239629181566976080/martijn-vonk-pCydkpyHMHs-unsplash.jpg?ex=66439e24&is=66424ca4&hm=cf7b813032998e7cc3b2db811518023b5567cbe264f9bbf982924eb947d5d539&',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage(
                                  idMarket: 2,
                                )),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Perikanan A',
                      photoUrl:
                          'https://cdn.discordapp.com/attachments/838266599348895784/1239629181566976080/martijn-vonk-pCydkpyHMHs-unsplash.jpg?ex=66439e24&is=66424ca4&hm=cf7b813032998e7cc3b2db811518023b5567cbe264f9bbf982924eb947d5d539&',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage(
                                  idMarket: 2,
                                )),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    MarketCard(
                      width: 120,
                      height: 148,
                      name: 'Perikanan A',
                      photoUrl:
                          'https://cdn.discordapp.com/attachments/838266599348895784/1239629181566976080/martijn-vonk-pCydkpyHMHs-unsplash.jpg?ex=66439e24&is=66424ca4&hm=cf7b813032998e7cc3b2db811518023b5567cbe264f9bbf982924eb947d5d539&',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage(
                                  idMarket: 2,
                                )),
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

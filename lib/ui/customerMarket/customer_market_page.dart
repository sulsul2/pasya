import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/customerMarket/data/market_provider.dart';
import 'package:pasya/ui/detailMarket/detail_market_page.dart';
import 'package:pasya/ui/widgets/custom_tab.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';
import 'package:provider/provider.dart';

class CustomerMarketPage extends StatefulWidget {
  const CustomerMarketPage({super.key, required this.title});

  final String title;

  @override
  State<CustomerMarketPage> createState() => _CustomerMarketPageState();
}

class _CustomerMarketPageState extends State<CustomerMarketPage> {
  int tipe = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    MarketProvider marketProvider = Provider.of<MarketProvider>(context);
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 100),
        // padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FormInput(
                textController: searchController,
                hintText: 'Cari pasar',
                label: 'Pasar',
                isSearch: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          tipe = 0;
                        });
                      },
                      child: CustomTab(
                          text: 'Bumbu',
                          color: tipe == 0 ? yellowColor : greyColor,
                          padding: 16)),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          tipe = 1;
                        });
                      },
                      child: CustomTab(
                          text: 'Ikan',
                          color: tipe == 1 ? yellowColor : greyColor,
                          padding: 16)),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          tipe = 2;
                        });
                      },
                      child: CustomTab(
                          text: 'Daging',
                          color: tipe == 2 ? yellowColor : greyColor,
                          padding: 16)),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          tipe = 3;
                        });
                      },
                      child: CustomTab(
                          text: 'Sayuran',
                          color: tipe == 3 ? yellowColor : greyColor,
                          padding: 16)),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          tipe = 4;
                        });
                      },
                      child: CustomTab(
                          text: 'Buahan',
                          color: tipe == 4 ? yellowColor : greyColor,
                          padding: 16)),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: marketProvider.marketList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var market = marketProvider.marketList[index];
                    return MarketCard(
                      width: 160,
                      height: 184,
                      name: market.name,
                      photoUrl: market.image,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailMarketPage(
                                  idMarket: market.id,
                                )),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            Header(
              text: widget.title,
              shop: true,
              back: true,
            ),
            content()
          ],
        ));
  }
}

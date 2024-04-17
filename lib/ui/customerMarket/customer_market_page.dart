import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/detailMarket/detail_market_page.dart';
import 'package:pasya/ui/widgets/custom_tab.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';

class CustomerMarketPage extends StatelessWidget {
  const CustomerMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 120),
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
                  CustomTab(text: 'Bumbu', color: yellowColor, padding: 16),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomTab(text: 'Ikan', color: greyColor, padding: 16),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomTab(text: 'Daging', color: greyColor, padding: 16),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomTab(text: 'Sayuran', color: greyColor, padding: 16),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomTab(text: 'Buahan', color: greyColor, padding: 16),
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
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return MarketCard(
                      width: 160,
                      height: 184,
                      name: 'Pasar A',
                      photoUrl: 'assets/pasar_ex.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMarketPage()),
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
            const Header(
              text: 'Pasar Tradisional',
              shop: true,
              back: true,
            ),
            content()
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/detailShop/detail_shop_page.dart';
import 'package:pasya/ui/widgets/custom_tab.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';

class DetailMarketPage extends StatelessWidget {
  const DetailMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FormInput(
                textController: searchController,
                hintText: 'Cari toko',
                label: 'Toko',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      name: 'Toko A',
                      photoUrl: 'assets/pasar_2.png',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailShopPage()),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            const Header(
              text: 'Pasar A',
              shop: true,
              back: true,
            ),
            content()
          ],
        ));
  }
}

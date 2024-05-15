import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/detailMarket/data/shop_provider.dart';
import 'package:pasya/ui/detailShop/detail_shop_page.dart';
import 'package:pasya/ui/widgets/custom_tab.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:pasya/ui/widgets/market_card.dart';
import 'package:provider/provider.dart';

class DetailMarketPage extends StatefulWidget {
  const DetailMarketPage({super.key, required this.idMarket});

  final int idMarket;

  @override
  State<DetailMarketPage> createState() => _DetailMarketPageState();
}

class _DetailMarketPageState extends State<DetailMarketPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<ShopProvider>(context, listen: false)
        .getShop(widget.idMarket));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    ShopProvider shopProvider = Provider.of<ShopProvider>(context);
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 100),
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
                  itemCount: shopProvider.shopList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var shop = shopProvider.shopList[index];
                    return MarketCard(
                      width: 160,
                      height: 184,
                      name: shop.name,
                      photoUrl: shop.picture,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailShopPage(
                                  id: shop.id,
                                )),
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

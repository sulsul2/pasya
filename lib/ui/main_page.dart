import 'package:flutter/material.dart';
import 'package:pasya/ui/chat/chat_page.dart';
import 'package:pasya/ui/order/order_page.dart';
import 'package:pasya/ui/profile/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:pasya/providers/page_provider.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/home/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget customBottonNavigation() {
      return SafeArea(
        child: Container(
          height: 64,
          padding:
              const EdgeInsets.only(left: 36, right: 36, bottom: 12, top: 14),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          decoration: BoxDecoration(
              color: blueColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: blueColor.withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  AnimatedBar(
                    isActive: pageProvider.currPage == 0,
                  ),
                  GestureDetector(
                    onTap: () => {pageProvider.setCurrPage = 0},
                    child: Icon(
                      Icons.home_filled,
                      color:
                          pageProvider.currPage == 0 ? yellowColor : whiteColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  AnimatedBar(
                    isActive: pageProvider.currPage == 1,
                  ),
                  GestureDetector(
                    onTap: () => {pageProvider.setCurrPage = 1},
                    child: Icon(
                      Icons.event_note,
                      color:
                          pageProvider.currPage == 1 ? yellowColor : whiteColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  AnimatedBar(
                    isActive: pageProvider.currPage == 2,
                  ),
                  GestureDetector(
                    onTap: () => {pageProvider.setCurrPage = 2},
                    child: Icon(
                      Icons.chat,
                      color:
                          pageProvider.currPage == 2 ? yellowColor : whiteColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  AnimatedBar(
                    isActive: pageProvider.currPage == 3,
                  ),
                  GestureDetector(
                    onTap: () => {pageProvider.setCurrPage = 3},
                    child: Icon(
                      Icons.person,
                      color:
                          pageProvider.currPage == 3 ? yellowColor : whiteColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      switch (pageProvider.currPage) {
        case 0:
          {
            return const HomePage();
          }
        case 1:
          {
            return const OrderPage();
          }
        case 2:
          {
            return const ChatPage();
          }
        default:
          {
            return const ProfilePage();
          }
      }
    }

    return Scaffold(
      // bottomNavigationBar: customBottonNavigation(),
      body: Stack(
        children: [
          content(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [customBottonNavigation()],
          )
        ],
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 3),
      height: 4,
      width: isActive ? 24 : 0,
      decoration: BoxDecoration(
          color: yellowColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

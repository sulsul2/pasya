import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 110),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [const Header(text: 'Beranda'), content()],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:pasya/ui/widgets/header.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Header(text: 'Pesanan Anda'),
          Center(child: Text('Order Page'))
        ],
      ),
    );
  }
}

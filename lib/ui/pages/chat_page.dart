import 'package:flutter/material.dart';
import 'package:pasya/ui/widgets/header.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [Header(text: 'Chat'), Center(child: Text('Chat Page'))],
      ),
    );
  }
}

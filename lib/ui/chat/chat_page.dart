import 'package:flutter/material.dart';
import 'package:pasya/ui/chat/presentation/image_loader.dart';
import 'package:pasya/ui/widgets/header.dart';

import 'presentation/chat_card.dart';

class ChatModel {
  const ChatModel({
    required this.username,
    required this.lastMessage,
    required this.lastTime,
    required this.imageUrl,
    required this.countUnread,
  });

  final String username;
  final String lastMessage;
  final DateTime lastTime;
  final String imageUrl;
  final int countUnread;
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = [
      ChatModel(
        username: 'John Bae',
        lastMessage: 'Hello, how are you?',
        lastTime: DateTime.now(),
        imageUrl:
            'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        countUnread: 12,
      ),
      ChatModel(
        username: 'Jane Smith',
        lastMessage: 'I am fine, thank you!',
        lastTime: DateTime.now().add(const Duration(hours: 1)),
        imageUrl:
            'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        countUnread: 2,
      ),
      ChatModel(
        username: 'John Doe',
        lastMessage:
            'Lets go for a walk around Gasibus Station! Is it okay? I am fine, thank you! I am fine, thank you!',
        lastTime: DateTime.now().add(const Duration(days: 1)),
        imageUrl:
            'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        countUnread: 0,
      ),
      ChatModel(
        username: 'John Doe',
        lastMessage:
            'Lets go for a walk around Gasibus Station! Is it okay? I am fine, thank you! I am fine, thank you!',
        lastTime: DateTime.now().add(const Duration(days: 1)),
        imageUrl:
            'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        countUnread: 0,
      ),
      ChatModel(
        username: 'John Doe',
        lastMessage:
            'Lets go for a walk around Gasibus Station! Is it okay? I am fine, thank you! I am fine, thank you!',
        lastTime: DateTime.now().add(const Duration(days: 1)),
        imageUrl:
            'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        countUnread: 0,
      ),
      ChatModel(
        username: 'John Doe',
        lastMessage:
            'Lets go for a walk around Gasibus Station! Is it okay? I am fine, thank you! I am fine, thank you!',
        lastTime: DateTime.now().add(const Duration(days: 1)),
        imageUrl:
            'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        countUnread: 0,
      ),
      ChatModel(
        username: 'John Doe',
        lastMessage:
            'Lets go for a walk around Gasibus Station! Is it okay? I am fine, thank you! I am fine, thank you!',
        lastTime: DateTime.now().add(const Duration(days: 1)),
        imageUrl:
            'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        countUnread: 0,
      ),
      ChatModel(
        username: 'John Doe',
        lastMessage:
            'Lets go for a walk around Gasibus Station! Is it okay? I am fine, thank you! I am fine, thank you!',
        lastTime: DateTime.now().add(const Duration(days: 1)),
        imageUrl:
            'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        countUnread: 0,
      ),
    ];

    Widget chatList() {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 20),
        children: chats.map((chat) => ChatCard(chat: chat, imageLoader: AssetImageLoader(),)).toList(),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            chatList(),
            const Header(text: 'Chat'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pasya/theme.dart';

import 'presentation/chat_bubble.dart';
import '../widgets/header.dart';

class ChatBubbleModel {
  const ChatBubbleModel({
    required this.username,
    required this.message,
    required this.time,
    required this.isSender,
    required this.imageUrl,
  });

  final String username;
  final String message;
  final DateTime time;
  final bool isSender;
  final String imageUrl;
}

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController chatController = TextEditingController();

    List<ChatBubbleModel> bubbles = [
      ChatBubbleModel(
          username: 'John Doe',
          message: 'Hello, how are you?',
          time: DateTime.now(),
          isSender: true,
          imageUrl: ''),
      ChatBubbleModel(
          username: 'Jane Smith',
          message: 'I am fine, thank you!',
          time: DateTime.now().add(const Duration(hours: 1)),
          isSender: false,
          imageUrl: ''),
      ChatBubbleModel(
          username: 'Jane Smith',
          message: 'I am fine, thank you!',
          time: DateTime.now().add(const Duration(days: 2)),
          isSender: false,
          imageUrl: ''),
      ChatBubbleModel(
        username: 'John Doe',
        message: 'Hello, Could you tell me where the nearest hospital is?',
        time: DateTime.now().add(const Duration(days: 2)),
        isSender: true,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1695735927052-a03480eaddd1?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      ChatBubbleModel(
        username: 'John Doe',
        message: 'Hello, Could you tell me where the nearest hospital is?',
        time: DateTime.now().add(const Duration(days: 3)),
        isSender: true,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1695735927052-a03480eaddd1?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      ChatBubbleModel(
        username: 'John Doe',
        message: 'Hello, Could you tell me where the nearest hospital is?',
        time: DateTime.now().add(const Duration(days: 3)),
        isSender: true,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1695735927052-a03480eaddd1?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      ChatBubbleModel(
        username: 'John Doe',
        message: 'Hello, Could you tell me where the nearest hospital is?',
        time: DateTime.now().add(const Duration(days: 3)),
        isSender: true,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1695735927052-a03480eaddd1?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      ChatBubbleModel(
        username: 'John Doe',
        message: 'Hello, Could you tell me where the nearest hospital is?',
        time: DateTime.now().add(const Duration(days: 3)),
        isSender: true,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1695735927052-a03480eaddd1?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      ChatBubbleModel(
        username: 'John Doe',
        message: 'Hello, Could you tell me where the nearest hospital is?',
        time: DateTime.now().add(const Duration(days: 3)),
        isSender: true,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1695735927052-a03480eaddd1?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      ChatBubbleModel(
        username: 'John Doe',
        message: 'Hello, Could you tell me where the nearest hospital is?',
        time: DateTime.now().add(const Duration(days: 3)),
        isSender: true,
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1695735927052-a03480eaddd1?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ];

    Widget bubbleList() {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 20),
        children: bubbles.map(
          (bubble) {
            int index = bubbles.indexOf(bubble);

            return ChatBubble(
              bubble: bubble,
              isDate: index == 0 ||
                  index > 0 &&
                      bubble.time.difference(bubbles[index - 1].time).inDays !=
                          0,
              isGap: index == 0 ||
                  index > 0 &&
                      bubble.time.difference(bubbles[index - 1].time).inDays !=
                          0 ||
                  bubble.isSender != bubbles[index - 1].isSender,
            );
          },
        ).toList(),
      );
    }

    Widget customBottonNavigation() {
      return Container(
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 32),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: yellowColor,
              ),
              alignment: Alignment.center,
              child: SpeedDial(
                elevation: 0,
                backgroundColor: yellowColor,
                childrenButtonSize: const Size(64, 64),
                spacing: 12,
                children: [
                  SpeedDialChild(
                    shape: const CircleBorder(),
                    backgroundColor: yellowColor,
                    child: Icon(
                      Icons.call,
                      color: blueColor,
                    ),
                  ),
                  SpeedDialChild(
                    shape: const CircleBorder(),
                    backgroundColor: yellowColor,
                    child: Icon(
                      Icons.image,
                      color: blueColor,
                    ),
                  ),
                ],
                activeChild: Icon(
                  Icons.close,
                  color: blueColor,
                  size: 32,
                ),
                activeBackgroundColor: whiteColor,
                child: Icon(
                  Icons.add,
                  color: blueColor,
                  size: 32,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: chatController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        cursorColor: yellowColor,
                        decoration: InputDecoration(
                          hintText: 'Write message...',
                          hintStyle: greyText,
                          focusColor: Colors.transparent,
                          contentPadding: const EdgeInsets.all(8),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            color: yellowColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            bubbleList(),
            const Header(
              text: 'Jane Smith',
              back: true,
              imageUrl:
                  'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBottonNavigation(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

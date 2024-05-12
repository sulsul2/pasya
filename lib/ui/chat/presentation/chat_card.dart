import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pasya/theme.dart';


import '../chat_page.dart';
import '../chat_room_page.dart';
import 'image_loader.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.chat, required this.imageLoader});

  final ChatModel chat;
  final ImageLoader imageLoader;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatRoomPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: blueColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: imageLoader.load(chat.imageUrl),
              backgroundColor: greyColor,
              maxRadius: 36,
              minRadius: 36,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.username,
                    style: blackText.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chat.lastMessage,
                    style: blackText.copyWith(
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat('dd-MMM').format(chat.lastTime),
                  style: blueText.copyWith(
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(height: 4),
                Visibility(
                  visible: chat.countUnread > 0,
                  child: CircleAvatar(
                    minRadius: 16,
                    maxRadius: 16,
                    backgroundColor: yellowColor,
                    child: Text(
                      chat.countUnread.toString(),
                      style: blueText.copyWith(
                        fontWeight: medium,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

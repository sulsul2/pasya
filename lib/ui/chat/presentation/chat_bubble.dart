import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../theme.dart';
import '../chat_room_page.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.bubble,
    required this.isDate,
    required this.isGap,
    super.key,
  });

  final ChatBubbleModel bubble;
  final bool isDate;
  final bool isGap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: isDate,
          child: Text(
            DateFormat('EE, dd-MMMM-yyyy').format(bubble.time),
            style: blueText,
          ),
        ),
        Visibility(
          visible: isGap,
          child: Row(
            mainAxisAlignment: bubble.isSender
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              CustomPaint(
                painter: RightTrianglePainter(
                  color: bubble.isSender ? secondaryYellowColor : greyColor,
                  isRight: bubble.isSender,
                ),
                size: const Size(8, 6),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment:
              bubble.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(
                bottom: 4,
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: !isGap
                        ? const Radius.circular(12)
                        : bubble.isSender
                            ? const Radius.circular(12)
                            : Radius.zero,
                    topRight: !isGap
                        ? const Radius.circular(12)
                        : bubble.isSender
                            ? Radius.zero
                            : const Radius.circular(12),
                    bottomLeft: const Radius.circular(12),
                    bottomRight: const Radius.circular(12)),
                color: bubble.isSender ? secondaryYellowColor : greyColor,
              ),
              child: Text(
                bubble.message,
                style: blackText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RightTrianglePainter extends CustomPainter {
  const RightTrianglePainter({
    this.color = Colors.blue,
    this.isRight = true,
  });

  final Color color;
  final bool isRight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // Change the color to your desired color
      ..style = PaintingStyle.fill;

    final path = Path();
    if (isRight) {
      path.moveTo(size.width, size.height);
      path.lineTo(size.width, 0);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(0, size.height);
      path.lineTo(0, 0);
      path.lineTo(size.width, size.height);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

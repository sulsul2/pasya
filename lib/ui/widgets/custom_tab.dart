import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.text,
    required this.color,
    required this.padding,
    this.icon,
  });

  final String text;
  final Color color;
  final double padding;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          if (icon != null)
            const SizedBox(
              width: 4,
            ),
          Text(
            text,
            style: color == blueColor
                ? whiteText.copyWith(fontWeight: semibold)
                : blackText.copyWith(fontWeight: semibold),
          ),
        ],
      ),
    );
  }
}

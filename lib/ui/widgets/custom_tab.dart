import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.text,
    required this.color,
    required this.padding,
  });

  final String text;
  final Color color;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20.0)),
      child: Text(
        text,
        style: color == blueColor
            ? whiteText.copyWith(fontWeight: semibold)
            : blackText.copyWith(fontWeight: semibold),
      ),
    );
  }
}

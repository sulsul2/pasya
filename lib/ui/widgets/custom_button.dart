import 'package:flutter/material.dart';

import '../../theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color buttonColor;
  final TextStyle textStyle;
  final double marginTop;
  final double marginBottom;
  final bool isFit;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.isFit = true,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      width: isFit ? null : double.infinity,
      padding: isFit
          ? const EdgeInsets.symmetric(vertical: 8, horizontal: 12)
          : null,
      height: isFit ? null : 36,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            Visibility(
              visible: icon != null,
              child: const SizedBox(width: 8),
            ),
            Text(
              buttonText,
              style: textStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

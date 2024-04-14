import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';

class ConditionTab extends StatelessWidget {
  const ConditionTab({super.key, required this.parameter, required this.value});

  final String parameter;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: blueColor.withOpacity(0.5), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            parameter,
            style: blackText,
          ),
          Text(
            ': $value',
            style: blackText,
          ),
          Visibility(
            visible: false,
            child: Text('Baru', style: blackText),
          ),
        ],
      ),
    );
  }
}

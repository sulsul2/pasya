import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/changeAddress/change_address_page.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {super.key,
      required this.title,
      required this.name,
      required this.number,
      required this.address,
      required this.icon,
      this.check = false,
      this.opacity = false});

  final String title;
  final String name;
  final String number;
  final String address;
  final bool icon;
  final bool check;
  final bool opacity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChangeAddressPage()),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: blueColor.withOpacity(0.5), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_filled,
                      color: blueColor,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      title,
                      style: blackText.copyWith(
                          fontSize: 16, fontWeight: semibold),
                    )
                  ],
                ),
                Container(
                  width: icon ? 28 : 0,
                  height: 28,
                  decoration: BoxDecoration(
                    color: opacity ? yellowColor.withOpacity(0.4) : yellowColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Icon(
                      check ? Icons.check : Icons.arrow_forward_ios_outlined,
                      color: blueColor,
                      size: icon ? 20.0 : 0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '$name ($number)',
              style: blackText,
            ),
            Text(
              address,
              style: blackText,
            )
          ],
        ),
      ),
    );
  }
}

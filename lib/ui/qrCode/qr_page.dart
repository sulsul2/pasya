import 'package:flutter/material.dart';
import 'package:pasya/providers/currency_format.dart';
import 'package:pasya/ui/qrCode/success_page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pasya/ui/widgets/header.dart';

class QRCodePage extends StatelessWidget {
  final String price;

  const QRCodePage({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Header(
            text: 'QR Code',
            back: true,
          ),
          Center(
            child:GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SuccessPage()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImageView(
                    data: "00020101021226570011ID.DANA.WWW011893600915048725377902094872537790303UKE51440014ID.CO.QRIS.WWW0215ID20232826047350303UKE5204899953033605405100005802ID5907Bantuin6012Kab. Jombang61056141762720115ZHap6BrCaQGSdTU60490011ID.DANA.WWW0425MER2021071400774509608641050116304C548",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  const SizedBox(height: 20.0), // Add some spacing between QR code and text
                  Text(
                    '$price',
                    style: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

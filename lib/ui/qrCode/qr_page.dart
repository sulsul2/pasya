import 'package:flutter/material.dart';
import 'package:pasya/providers/currency_format.dart';
import 'package:pasya/ui/qrCode/success_page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QRCodePage extends StatefulWidget {
  final int price;

  const QRCodePage({Key? key, required this.price}) : super(key: key);

  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  late Future<Map<String, dynamic>> qrCodeData;

  @override
  void initState() {
    super.initState();
    qrCodeData = fetchQRCodeData();
  }

  Future<Map<String, dynamic>> fetchQRCodeData() async {
    String apiKey = 'xnd_production_ztyucKjeJhZrcF3i6SzQms4OmaRiPjR2LOpjqEyaZis2Dt8mhwmeju6K0MWq5tu3';
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    DateTime now = DateTime.now().toUtc();
    DateTime expiresAtDateTime = now.add(Duration(days: 1));
    String expiresAt = expiresAtDateTime.toIso8601String() ;

    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiKey:'));
    try {
      final response = await http.post(
        Uri.parse('https://api.xendit.co/qr_codes'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': basicAuth,
          'api-version': '2022-07-31',
        },
        body: jsonEncode(<String, dynamic>{
          "reference_id": "order-id-$timestamp",
          "type": "DYNAMIC",
          "currency": "IDR",
          "amount": widget.price,
          "expires_at": expiresAt,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        // Log the response for debugging
        print('Failed response: ${response.body}');
        throw Exception('Failed to load QR code data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error for debugging
      print('Exception caught: $e');
      print( widget.price );
      print (expiresAt);
      throw Exception('Failed to load QR code data. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // Set the background color to white
        body: FutureBuilder<Map<String, dynamic>>(
          future: qrCodeData,
          builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Stack(
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
                            data: snapshot.data!['qr_string'],
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                          const SizedBox(height: 20.0), // Add some spacing between QR code and text
                          Text(
                            CurrencyFormat.convertToIdr(snapshot.data!['amount'], 2),
                            style: const TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              );
            }
          },
        ),
    );
  }

}

// class QRCodePage extends StatefulWidget {
//   final int price;
//
//   const QRCodePage({Key? key, required this.price}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           const Header(
//             text: 'QR Code',
//             back: true,
//           ),
//           Center(
//             child:GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SuccessPage()),
//                 );
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   QrImageView(
//                     data: "00020101021226570011ID.DANA.WWW011893600915048725377902094872537790303UKE51440014ID.CO.QRIS.WWW0215ID20232826047350303UKE5204899953033605405100005802ID5907Bantuin6012Kab. Jombang61056141762720115ZHap6BrCaQGSdTU60490011ID.DANA.WWW0425MER2021071400774509608641050116304C548",
//                     version: QrVersions.auto,
//                     size: 200.0,
//                   ),
//                   const SizedBox(height: 20.0), // Add some spacing between QR code and text
//                   Text(
//                     CurrencyFormat.convertToIdr(price, 2),
//                     style: const TextStyle(fontSize: 24),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }

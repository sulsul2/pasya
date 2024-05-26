import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/get_profile.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends  State<ProfilePage>  {
  Future<Map<String, dynamic>>? _futureUserData;

  @override
  void initState() {
    super.initState();
    _futureUserData = fetchUserData();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    Widget content(Map<String, dynamic> userData) {

      nameController.text = userData['name'];
      emailController.text = userData['email'];
      phoneController.text = userData['phoneNumber'] ?? '';
      addressController.text = userData['address'] ?? '';
      print(userData);
      return Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/profil.png',
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 16,
                ),
                FormInput(
                  textController: nameController,
                  hintText: 'No Name is Set',
                  label: 'Nama',
                  status: false,
                  suffix: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                  textController: emailController,
                  hintText: 'No email is set',
                  label: 'Email',

                  status: false,
                  suffix: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                  textController: phoneController,
                  hintText: 'No Phone Number set',
                  label: 'Nomor HP',

                  status: false,
                  suffix: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                  textController: addressController,
                  hintText: 'No Alamat is set',
                  label: 'Alamat',
                  status: false,
                  suffix: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: GestureDetector(
                        onTap: () async {
                          // Perform logout operation here
                          // For example, you might want to remove the user token from shared preferences
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove('token');

                          // Then navigate to the login page
                          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Log Out',
                              style: whiteText.copyWith(
                                fontSize: 16,
                                fontWeight: semibold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 96,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return FutureBuilder<Map<String, dynamic>>(
      future: _futureUserData,
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return Scaffold(
            body: Stack(
              children: [
                const Header(text: 'Profile'),
                content(snapshot.data!), // Pass snapshot.data to content function
              ],
            ),
          );
        } else {
          // If snapshot is null, re-run the Future and rebuild the widget
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            setState(() {
              _futureUserData = fetchUserData();
            });
          });
          return Text('No data available');
        }
      },
    );


  }
}

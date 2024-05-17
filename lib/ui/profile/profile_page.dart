import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    Widget content() {
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
                  hintText: 'hintText',
                  label: 'Nama',
                  defaultValue: 'Agil Fuad Gumelar',
                  status: false,
                  suffix: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                  textController: emailController,
                  hintText: 'hintText',
                  label: 'Email',
                  defaultValue: 'admin@admin.com',
                  status: false,
                  suffix: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                  textController: phoneController,
                  hintText: 'hintText',
                  label: 'Nomor HP',
                  defaultValue: '+62 81231122121',
                  status: false,
                  suffix: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                  textController: addressController,
                  hintText: 'hintText',
                  label: 'Alamat',
                  defaultValue:
                      'Jalan Sekeloa, Gang Kubangsari III, Coblong, Bandung',
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

    return Scaffold(
      body: Stack(
        children: [
          const Header(text: 'Profile'),
          content(),
        ],
      ),
    );
  }
}

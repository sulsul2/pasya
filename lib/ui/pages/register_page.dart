import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/form_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Widget content() {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 68),
            width: double.infinity,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/pasya_logo.png',
                width: 80,
                height: 80,
              ),
            ]),
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36))),
                margin: const EdgeInsets.only(top: 200),
                padding: const EdgeInsets.only(top: 23, left: 20, right: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: blackText.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 7,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 200, left: 150),
                padding: const EdgeInsets.only(top: 23),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: blackText.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 30),
            margin: const EdgeInsets.only(top: 270),
            width: double.infinity,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang! Register',
                  style: blackText.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FormInput(
                  textController: usernameController,
                  hintText: 'Input your username',
                  validator: 'Please input username',
                  label: 'Username',
                ),
                const SizedBox(
                  height: 20,
                ),
                FormInput(
                  textController: passwordController,
                  hintText: 'Input your password',
                  validator: 'Please input password',
                  label: 'Password',
                  isPassword: true,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: yellowColor,
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
                            'Masuk',
                            style: blackText.copyWith(
                              fontSize: 16,
                              fontWeight: semibold,
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tidak ada akun? ',
                      style:
                          blackText.copyWith(fontSize: 16, fontWeight: regular),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: Text(
                          'Daftar sekarang',
                          style: blueText.copyWith(
                              fontSize: 16, fontWeight: semibold),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
        backgroundColor: blueColor, body: SafeArea(child: content()));
  }
}

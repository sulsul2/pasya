import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/form_input.dart';

import 'domain/register_function.dart';
import 'domain/register_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool agreeToTerms = false;

  // Move the creation of your TextEditingController's here
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false),
                child: Container(
                  decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  margin: const EdgeInsets.only(top: 200),
                  padding: const EdgeInsets.only(top: 23, left: 60),
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
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
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
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Create Yout Account',
                      style: blackText.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FormInput(
                      textController: nameController,
                      hintText: 'Input your name',
                      validator: 'Please input name',
                      label: 'Name',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // FormInput(
                    //   textController: addressController,
                    //   hintText: 'Input your address',
                    //   validator: 'Please input address',
                    //   label: 'Address',
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    FormInput(
                      textController: emailController,
                      hintText: 'Input your email',
                      validator: 'Please input email',
                      label: 'Email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // FormInput(
                    //   textController: numberController,
                    //   hintText: 'Input your number',
                    //   validator: 'Please input number',
                    //   label: 'Number',
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    FormInput(
                      textController: passwordVerifController,
                      hintText: 'Input your password again',
                      validator: 'Please input password',
                      label: 'Password Verification',
                      isPassword: true,
                    ),
                    // const Spacer(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: agreeToTerms,
                          onChanged: (newValue) {
                            setState(() {
                              agreeToTerms = !agreeToTerms;
                            });
                          },
                          shape: const CircleBorder(),
                          // activeColor: yellowColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saya menyetujui syarat dan ketentuan',
                              style: blackText.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'PASYA yang berlaku',
                              style: blackText.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: () async {
                          try {
                            final registerModel = RegisterModel(
                              name: nameController.text,
                              userName: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: passwordVerifController.text,
                            );
                            print(nameController.text);
                            print(usernameController.text);
                            print(emailController.text);
                            print(passwordController.text);
                            print(passwordVerifController.text);
                            await register(registerModel);
                            // Navigate to the login page if registration is successful
                            Navigator.pushNamed(context, "/login");
                          } catch (e) {
                            print(e);
                            // Show a Scaffold message if registration fails
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to register: $e')),
                            );
                          }
                        },
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
                                'Daftar Akun',
                                style: blackText.copyWith(
                                  fontSize: 16,
                                  fontWeight: semibold,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
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

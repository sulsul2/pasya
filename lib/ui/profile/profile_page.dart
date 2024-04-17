import 'package:flutter/material.dart';
import 'package:pasya/ui/widgets/header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Header(text: 'Profile'),
          Center(child: Text('Profile Page'))
        ],
      ),
    );
  }
}

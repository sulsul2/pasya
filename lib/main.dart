import 'package:flutter/material.dart';
import 'package:pasya/providers/page_provider.dart';
// import 'package:pasya/ui/pages/home_page.dart';
import 'package:pasya/ui/pages/login_page.dart';
import 'package:pasya/ui/pages/main_page.dart';
import 'package:pasya/ui/pages/register_page.dart';
import 'package:pasya/ui/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PageProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const SplashPage(),
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/main': (context) => const MainPage(),
          },
        ));
  }
}

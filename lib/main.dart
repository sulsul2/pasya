import 'package:flutter/material.dart';
import 'package:pasya/providers/page_provider.dart';
// import 'package:pasya/ui/pages/home_page.dart';
import 'package:pasya/ui/auth/login_page.dart';
import 'package:pasya/ui/main_page.dart';
import 'package:pasya/ui/auth/register_page.dart';
import 'package:pasya/ui/splash/splash_page.dart';
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

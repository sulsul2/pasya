import 'package:flutter/material.dart';
import 'package:pasya/providers/page_provider.dart';
// import 'package:pasya/ui/pages/home_page.dart';
import 'package:pasya/ui/auth/login_page.dart';
import 'package:pasya/ui/customerMarket/data/market_provider.dart';
import 'package:pasya/ui/detailMarket/data/shop_provider.dart';
import 'package:pasya/ui/detailProduct/data/product_provider.dart';
import 'package:pasya/ui/main_page.dart';
import 'package:pasya/ui/auth/register_page.dart';
import 'package:pasya/ui/splash/splash_page.dart';
import 'package:pasya/ui/cart/data/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PageProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => MarketProvider()),
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => ShopProvider()),
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

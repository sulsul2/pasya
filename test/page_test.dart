import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pasya/ui/addProduct/add_product_page.dart';
import 'package:pasya/ui/auth/login_page.dart';
import 'package:pasya/ui/auth/register_page.dart';
import 'package:pasya/ui/cart/cart_page.dart';
import 'package:pasya/ui/changeAddress/change_address_page.dart';
import 'package:pasya/ui/chat/chat_page.dart';
import 'package:pasya/ui/checkout/checkout_page.dart';
import 'package:pasya/ui/customerMarket/customer_market_page.dart';
import 'package:pasya/ui/detailMarket/detail_market_page.dart';
import 'package:pasya/ui/detailShop/detail_shop_page.dart';
import 'package:pasya/ui/order/order_page.dart';
import 'package:pasya/ui/payment/payment_page.dart';
import 'package:pasya/ui/profile/profile_page.dart';


void main() {
  testWidgets('ChatPage Widget Test', (WidgetTester tester) async {
// Build the ChatPage widget
    await tester.pumpWidget(const MaterialApp(
      home: ChatPage(),
    ));

// Find the ChatPage widget
    final chatPageFinder = find.byType(ChatPage);

// Verify that the ChatPage widget is displayed
    expect(chatPageFinder, findsOneWidget);
  });

  testWidgets('Add Product Page Widget Test', (WidgetTester tester) async {
// Build the ChatPage widget
    await tester.pumpWidget(const MaterialApp(
      home: AddProductPage(),
    ));

// Find the AddProductPage widget
    final addProductPageFinder = find.byType(AddProductPage);

// Verify that the AddProductPage widget is displayed
    expect(addProductPageFinder, findsOneWidget);
  });

  testWidgets('cart Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CartPage(),
    ));

    final cartPagePageFinder = find.byType(CartPage);

    expect(cartPagePageFinder, findsOneWidget);
  });

  testWidgets('Change Address Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ChangeAddressPage(),
    ));

    final changeAddressPagePageFinder = find.byType(ChangeAddressPage);

    expect(changeAddressPagePageFinder, findsOneWidget);
  });


  testWidgets('Checkout Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CheckoutPage(),
    ));

    final checkoutPageFinder = find.byType(CheckoutPage);

    expect(checkoutPageFinder, findsOneWidget);
  });

  testWidgets('Customer Market Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CustomerMarketPage(),
    ));

    final customerPageOneFinder = find.byType(CustomerMarketPage);

    expect(customerPageOneFinder, findsOneWidget);
  });

  testWidgets('Detail Market Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DetailMarketPage(),
    ));

    final detailMarketPageFinder = find.byType(DetailMarketPage);

    expect(detailMarketPageFinder, findsOneWidget);
  });



  testWidgets('Detail Shop Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DetailShopPage(),
    ));

    final detailShopPageFinder = find.byType(DetailShopPage);

    expect(detailShopPageFinder, findsOneWidget);
  });

  testWidgets('Login Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: const [
                  SizedBox(
                    width: 200.0,
                    height: 300.0,
                    child:LoginPage(),
                  ),
                ],
              ),
            ),
          ],
        )
    ));

    final loginPageFinder = find.byType(LoginPage);

    expect(loginPageFinder, findsOneWidget);
  });


  testWidgets('Order Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: OrderPage(),
    ));

    final orderPageFinder = find.byType(OrderPage);

    expect(orderPageFinder, findsOneWidget);
  });

  testWidgets('Payment Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: PaymentPage(),
    ));

    final paymentPageFinder = find.byType(PaymentPage);

    expect(paymentPageFinder, findsOneWidget);
  });

  testWidgets('Profile Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ProfilePage(),
    ));

    final profilePageFinder = find.byType(ProfilePage);

    expect(profilePageFinder, findsOneWidget);
  });

  testWidgets('Register Page Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: RegisterPage(),
    ));

    final registerPageFinder = find.byType(RegisterPage);

    expect(registerPageFinder, findsOneWidget);
  });


}

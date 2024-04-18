import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/cart/presentation/cart_card.dart';
import 'package:pasya/ui/chat/chat_page.dart';
import 'package:pasya/ui/chat/chat_room_page.dart';
import 'package:pasya/ui/chat/presentation/chat_bubble.dart';
import 'package:pasya/ui/widgets/address_card.dart';


void main() {
  testWidgets('AddressCard Widget Test', (WidgetTester tester) async {
    // Build the AddressCard widget with required parameters
    await tester.pumpWidget(const MaterialApp(
      home: AddressCard(
        title: 'Home',
        name: 'Rahman Atisura',
        number: '624556693780',
        address: 'Jl. Ciumbuleuit No.50 - 58, Hegarmanah, Kec. Cidadap, Kota Bandung, Jawa Barat 40141',
        icon: true,
        opacity: true,
      ),
    ));

    // Find the AddressCard widget
    final addressCardFinder = find.byType(AddressCard);

    // Verify that the AddressCard widget is displayed
    expect(addressCardFinder, findsOneWidget);
  });

  testWidgets('CartCard Widget Test', (WidgetTester tester) async {
    // Build the CartCard widget
    await tester.pumpWidget(const MaterialApp(
      home: CartCard(
          photoUrl: 'assets/detail_shop_2.png',
          name: 'Daging Ayam Paha',
          price: 40000,
          count: 1),
    ));

    // Find the CartCard widget
    final cartCardFinder = find.byType(CartCard);

    // Verify that the CartCard widget is displayed
    expect(cartCardFinder, findsOneWidget);
  });

  testWidgets('ChatBubble Widget Test', (WidgetTester tester) async {
    // Build the ChatBubble widget
    var bubble =  ChatBubbleModel(
        username: 'John Doe',
        message: 'Hello, how are you?',
        time: DateTime.now(),
        isSender: true,
        imageUrl: '');

    await tester.pumpWidget(MaterialApp(
      home: ChatBubble(
        bubble: bubble ,
        isDate: false,
        isGap: true,
      ),
    ));

    // Find the ChatBubble widget
    final chatBubbleFinder = find.byType(ChatBubble);

    // Verify that the ChatBubble widget is displayed
    expect(chatBubbleFinder, findsOneWidget);
  });

  testWidgets('ChatCard Widget Test', (WidgetTester tester) async {
    // Define the chat model
    List<ChatModel> chats = [
      ChatModel(
        username: 'John Bae',
        lastMessage: 'Hello, how are you?',
        lastTime: DateTime.now(),
        imageUrl:
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        countUnread: 12,
      ),
    ];

    // Build the ChatCard widget
    await tester.pumpWidget(MaterialApp(
      home: ListView(
        padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 20),
        children: chats.map((chat) => ChatCard(chat: chat,  imageLoader: AssetImageLoader())).toList(),
      ),
    ));

    // Find the ChatCard widget
    final chatCardFinder = find.byType(ChatCard);

    // Verify that the ChatCard widget is displayed
    expect(chatCardFinder, findsOneWidget);
  });

  testWidgets('CheckoutCard Widget Test', (WidgetTester tester) async {
    // Build the CheckoutCard widget
    await tester.pumpWidget(const MaterialApp(
      home: CheckoutCard(
        photoUrl: 'assets/ayam_mentah.png',
        name: 'Daging Ayam Paha',
        price: 40000,
        count: 1,
        opacity: true,
      ),
    ));

    // Find the CheckoutCard widget
    final checkoutCardFinder = find.byType(CheckoutCard);

    // Verify that the CheckoutCard widget is displayed
    expect(checkoutCardFinder, findsOneWidget);
  });

  testWidgets('ConditionTab Widget Test', (WidgetTester tester) async {
    // Build the ConditionTab widget
    await tester.pumpWidget(const MaterialApp(
      home: ConditionTab(
        parameter: 'Kondisi Barang',
        value: 'Baru',
      ),
    ));

    // Find the ConditionTab widget
    final conditionTabFinder = find.byType(ConditionTab);

    // Verify that the ConditionTab widget is displayed
    expect(conditionTabFinder, findsOneWidget);
  });

  testWidgets('CustomDropdown Widget Test', (WidgetTester tester) async {
    const List<String> list = <String>[
      'Bandung',
      'Jakarta',
      'Bogor',
      'Bekasih'
    ];
    // Build the CustomDropdown widget
    await tester.pumpWidget(const MaterialApp(
      home: CustomDropDown(
        list: list,
        placeholder: 'Pilih Kota',
      ),
    ));

    // Find the CustomDropdown widget
    final customDropdownFinder = find.byType(CustomDropDown);

    // Verify that the CustomDropdown widget is displayed
    expect(customDropdownFinder, findsOneWidget);
  });

  testWidgets('CustomTab Widget Test', (WidgetTester tester) async {
    // Build the CustomTab widget
    await tester.pumpWidget(MaterialApp(
      home: CustomTab(text: 'Bumbu', color: yellowColor, padding: 16),
    ));

    // Find the CustomTab widget
    final customTabFinder = find.byType(CustomTab);

    // Verify that the CustomTab widget is displayed
    expect(customTabFinder, findsOneWidget);
  });

  testWidgets('DeliveryCard Widget Test', (WidgetTester tester) async {
    // Build the DeliveryCard widget
    await tester.pumpWidget(const MaterialApp(
      home: DeliveryCard(
        name: 'Gojek',
        price: '20.000',
        time: 30,
        icon: true,
        check: true,
      ),
    ));

    // Find the DeliveryCard widget
    final deliveryCardFinder = find.byType(DeliveryCard);

    // Verify that the DeliveryCard widget is displayed
    expect(deliveryCardFinder, findsOneWidget);
  });

  testWidgets('FormInput Widget Test', (WidgetTester tester) async {
    // Build the DormInput widget
    TextEditingController searchController = TextEditingController();
    await tester.pumpWidget(MaterialApp(
      home: FormInput(
        textController: searchController,
        hintText: 'Cari toko',
        label: 'Toko',
        isSearch: true,
      ),
    ));

    // Find the DormInput widget
    final FormInputFinder = find.byType(FormInput);

    // Verify that the DormInput widget is displayed
    expect(FormInputFinder, findsOneWidget);
  });

  testWidgets('Header Widget Test', (WidgetTester tester) async {
    // Build the Header widget
    await tester.pumpWidget(const MaterialApp(
      home: Header(
        text: 'Test Header',
        shop: true,
      ),
    ));

    // Find the Header widget
    final headerFinder = find.byType(Header);

    // Verify that the Header widget is displayed
    expect(headerFinder, findsOneWidget);
  });

  testWidgets('Market Card Test', (WidgetTester tester) async {
    // Build the Header widget
    await tester.pumpWidget(MaterialApp(
        home: MarketCard(
          width: 160,
          height: 184,
          name: 'Toko A',
          photoUrl: 'assets/pasar_2.png', onPressed: () {  },
        )
    ));

    // Find the Header widget
    final MarketCardFinder = find.byType(MarketCard);

    // Verify that the Header widget is displayed
    expect(MarketCardFinder, findsOneWidget);
  });

  testWidgets('Order Card Test', (WidgetTester tester) async {
    // Build the Header widget
    await tester.pumpWidget(const MaterialApp(
        home: OrderCard(
          tipe: 1,
        )
    ));

    // Find the Header widget
    final OrderCardFinder = find.byType(OrderCard);

    // Verify that the Header widget is displayed
    expect(OrderCardFinder, findsOneWidget);
  });

  testWidgets('Payment Card Test', (WidgetTester tester) async {
    // Build the Header widget
    await tester.pumpWidget(const MaterialApp(
        home: PaymentCard(
            name: 'Pasya-Pay',
            isSaldo: true,
            saldo: '200.000',
            isCheck: true)
    ));

    // Find the Header widget
    final PaymentCardFinder = find.byType(PaymentCard);

    // Verify that the Header widget is displayed
    expect(PaymentCardFinder, findsOneWidget);
  });

  testWidgets('Review Card Test', (WidgetTester tester) async {
    // Build the Header widget
    await tester.pumpWidget(const MaterialApp(
        home:ReviewCard(
          name: 'Hessniya',
          rating: 2,
          profilUrl: '',
          description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        )
    ));

    // Find the Header widget
    final ReviewCardFinder = find.byType(ReviewCard);

    // Verify that the Header widget is displayed
    expect(ReviewCardFinder, findsOneWidget);
  });
}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pasya/ui/chat/chat_page.dart';


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
}

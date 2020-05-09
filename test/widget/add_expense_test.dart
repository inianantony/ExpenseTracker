import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/main.dart';

void main() {
  testWidgets('Can Add a New Expense', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());

    final amountTextField = find.byKey(Key('amountField'));
    final firstEntryInList = find.byKey(Key("item_1"));
    final addExpenseButton = find.byKey(Key('addExpenseButton'));

    expect(firstEntryInList, findsNothing);

    await tester.enterText(amountTextField, '10');

    await tester.tap(addExpenseButton);

    await tester.pump();

    expect(find.byKey(Key("item_1")), findsOneWidget);

  });
}
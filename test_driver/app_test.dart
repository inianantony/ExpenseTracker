import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Expense Tracker App', () {
    FlutterDriver driver;
    final amountTextField = find.byValueKey('amountField');
    final buttonFinder = find.byValueKey('addExpenseButton');
    final firstEntryInList = find.byValueKey('item_1');
    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    isPresent(SerializableFinder byValueKey, FlutterDriver driver,
        {Duration timeout = const Duration(seconds: 1)}) async {
      try {
        await driver.waitFor(byValueKey, timeout: timeout);
        return true;
      } catch (exception) {
        return false;
      }
    }

    test('List is empty', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      final isExists = await isPresent(firstEntryInList, driver);
      if (isExists) {
        print('widget is present');
      } else {
        print('widget is not present');
      }
      expect(isExists, false);
    });

    test('Add new expense', () async {
      // First, tap the button.
      await driver.tap(amountTextField); // acquire focus
      await driver.enterText('10'); // enter text

      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      final isExists = await isPresent(firstEntryInList, driver);
      if (isExists) {
        print('widget is present');
      } else {
        print('widget is not present');
      }
      expect(isExists, true);
    });
    
  });
}
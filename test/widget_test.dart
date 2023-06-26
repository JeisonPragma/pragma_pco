import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pco/features/url_shorten/ui/widgets/url_list_widget.dart';

void main() {
  testWidgets('UrlListWidget has a title and list',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UrlListWidget(
              urlCleaned: ['https://www.google.com', 'https://www.bing.com']),
        ),
      ),
    );

    final listFinder = find.byType(ListView);
    final textItemList = find.byKey(const Key('url_item_1'));

    expect(listFinder, findsOneWidget);
    expect(textItemList, findsOneWidget);
  });
}

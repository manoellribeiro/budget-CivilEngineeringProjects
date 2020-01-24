import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/components/menuItem/menuItem_widget.dart';

main() {
  testWidgets('MenuItemWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(MenuItemWidget()));
    final textFinder = find.text('MenuItem');
    expect(textFinder, findsOneWidget);
  });
}

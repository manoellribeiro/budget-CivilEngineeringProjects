import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/info/info_page.dart';

main() {
  testWidgets('InfoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(InfoPage(title: 'Info')));
    final titleFinder = find.text('Info');
    expect(titleFinder, findsOneWidget);
  });
}

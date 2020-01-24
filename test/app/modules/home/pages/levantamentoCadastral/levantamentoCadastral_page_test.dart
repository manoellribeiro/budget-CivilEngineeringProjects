import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/levantamentoCadastral/levantamentoCadastral_page.dart';

main() {
  testWidgets('LevantamentoCadastralPage has title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
        LevantamentoCadastralPage(title: 'LevantamentoCadastral')));
    final titleFinder = find.text('LevantamentoCadastral');
    expect(titleFinder, findsOneWidget);
  });
}

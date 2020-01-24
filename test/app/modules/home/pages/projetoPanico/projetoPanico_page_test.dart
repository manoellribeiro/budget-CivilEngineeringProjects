import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/projetoPanico/projetoPanico_page.dart';

main() {
  testWidgets('ProjetoPanicoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(ProjetoPanicoPage(title: 'ProjetoPanico')));
    final titleFinder = find.text('ProjetoPanico');
    expect(titleFinder, findsOneWidget);
  });
}

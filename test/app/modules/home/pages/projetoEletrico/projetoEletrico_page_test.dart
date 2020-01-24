import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/projetoEletrico/projetoEletrico_page.dart';

main() {
  testWidgets('ProjetoEletricoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(ProjetoEletricoPage(title: 'ProjetoEletrico')));
    final titleFinder = find.text('ProjetoEletrico');
    expect(titleFinder, findsOneWidget);
  });
}

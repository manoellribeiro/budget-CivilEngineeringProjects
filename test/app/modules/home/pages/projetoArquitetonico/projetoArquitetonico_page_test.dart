import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/projetoArquitetonico/projetoArquitetonico_page.dart';

main() {
  testWidgets('ProjetoArquitetonicoPage has title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
        ProjetoArquitetonicoPage(title: 'ProjetoArquitetonico')));
    final titleFinder = find.text('ProjetoArquitetonico');
    expect(titleFinder, findsOneWidget);
  });
}

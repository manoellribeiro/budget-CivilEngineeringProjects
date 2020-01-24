import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/projetoHidrossanitario/projetoHidrossanitario_page.dart';

main() {
  testWidgets('ProjetoHidrossanitarioPage has title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
        ProjetoHidrossanitarioPage(title: 'ProjetoHidrossanitario')));
    final titleFinder = find.text('ProjetoHidrossanitario');
    expect(titleFinder, findsOneWidget);
  });
}

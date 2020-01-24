import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/page/budgets_view/budgets_view_page.dart';

main() {
  testWidgets('BudgetsViewPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(BudgetsViewPage(title: 'BudgetsView')));
    final titleFinder = find.text('BudgetsView');
    expect(titleFinder, findsOneWidget);
  });
}

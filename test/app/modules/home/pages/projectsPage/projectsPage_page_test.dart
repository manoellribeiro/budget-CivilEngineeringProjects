import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/projectsPage/projectsPage_page.dart';

main() {
  testWidgets('ProjectsPagePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(ProjectsPagePage(title: 'ProjectsPage')));
    final titleFinder = find.text('ProjectsPage');
    expect(titleFinder, findsOneWidget);
  });
}

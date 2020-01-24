import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/splashScreen/splashScreen_page.dart';

main() {
  testWidgets('SplashScreenPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(SplashScreenPage(title: 'SplashScreen')));
    final titleFinder = find.text('SplashScreen');
    expect(titleFinder, findsOneWidget);
  });
}

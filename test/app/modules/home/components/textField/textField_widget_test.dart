import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/components/textField/textField_widget.dart';

main() {
  testWidgets('TextFieldWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TextFieldWidget()));
    final textFinder = find.text('TextField');
    expect(textFinder, findsOneWidget);
  });
}

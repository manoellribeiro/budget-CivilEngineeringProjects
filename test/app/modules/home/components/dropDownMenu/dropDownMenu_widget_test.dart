import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/components/dropDownMenu/dropDownMenu_widget.dart';

main() {
  testWidgets('DropDownMenuWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(DropDownMenuWidget()));
    final textFinder = find.text('DropDownMenu');
    expect(textFinder, findsOneWidget);
  });
}

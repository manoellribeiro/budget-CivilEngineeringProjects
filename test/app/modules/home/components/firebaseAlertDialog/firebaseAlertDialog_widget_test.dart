import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/components/firebaseAlertDialog/firebaseAlertDialog_widget.dart';

main() {
  testWidgets('FirebaseAlertDialogWidget has message',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(FirebaseAlertDialogWidget()));
    final textFinder = find.text('FirebaseAlertDialog');
    expect(textFinder, findsOneWidget);
  });
}

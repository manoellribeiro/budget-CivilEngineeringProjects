import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/parcial_review/parcial_review_page.dart';

main() {
  testWidgets('ParcialReviewPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(ParcialReviewPage(title: 'ParcialReview')));
    final titleFinder = find.text('ParcialReview');
    expect(titleFinder, findsOneWidget);
  });
}

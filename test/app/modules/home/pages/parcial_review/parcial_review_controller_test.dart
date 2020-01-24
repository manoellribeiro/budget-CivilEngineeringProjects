import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/parcial_review/parcial_review_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  ParcialReviewController parcialreview;

  setUp(() {
    parcialreview = HomeModule.to.get<ParcialReviewController>();
  });

  group('ParcialReviewController Test', () {
    test("First Test", () {
      expect(parcialreview, isInstanceOf<ParcialReviewController>());
    });

    test("Set Value", () {
      expect(parcialreview.value, equals(0));
      parcialreview.increment();
      expect(parcialreview.value, equals(1));
    });
  });
}

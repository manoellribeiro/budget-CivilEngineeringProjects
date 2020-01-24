import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precificacaodeprojetos/app/modules/home/page/budgets_view/budgets_view_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  BudgetsViewController budgetsview;

  setUp(() {
    budgetsview = HomeModule.to.get<BudgetsViewController>();
  });

  group('BudgetsViewController Test', () {
    test("First Test", () {
      expect(budgetsview, isInstanceOf<BudgetsViewController>());
    });

    test("Set Value", () {
      expect(budgetsview.value, equals(0));
      budgetsview.increment();
      expect(budgetsview.value, equals(1));
    });
  });
}

import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/projetoEletrico/projetoEletrico_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  ProjetoEletricoController projetoeletrico;

  setUp(() {
    projetoeletrico = HomeModule.to.get<ProjetoEletricoController>();
  });

  group('ProjetoEletricoController Test', () {
    test("First Test", () {
      expect(projetoeletrico, isInstanceOf<ProjetoEletricoController>());
    });

    test("Set Value", () {
      expect(projetoeletrico.value, equals(0));
      projetoeletrico.increment();
      expect(projetoeletrico.value, equals(1));
    });
  });
}

import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/projetoPanico/projetoPanico_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  ProjetoPanicoController projetopanico;

  setUp(() {
    projetopanico = HomeModule.to.get<ProjetoPanicoController>();
  });

  group('ProjetoPanicoController Test', () {
    test("First Test", () {
      expect(projetopanico, isInstanceOf<ProjetoPanicoController>());
    });

    test("Set Value", () {
      expect(projetopanico.value, equals(0));
      projetopanico.increment();
      expect(projetopanico.value, equals(1));
    });
  });
}

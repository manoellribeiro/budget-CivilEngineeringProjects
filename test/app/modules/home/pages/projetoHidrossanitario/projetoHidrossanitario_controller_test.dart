import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/projetoHidrossanitario/projetoHidrossanitario_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  ProjetoHidrossanitarioController projetohidrossanitario;

  setUp(() {
    projetohidrossanitario =
        HomeModule.to.get<ProjetoHidrossanitarioController>();
  });

  group('ProjetoHidrossanitarioController Test', () {
    test("First Test", () {
      expect(projetohidrossanitario,
          isInstanceOf<ProjetoHidrossanitarioController>());
    });

    test("Set Value", () {
      expect(projetohidrossanitario.value, equals(0));
      projetohidrossanitario.increment();
      expect(projetohidrossanitario.value, equals(1));
    });
  });
}

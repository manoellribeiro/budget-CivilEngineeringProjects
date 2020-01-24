import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/projetoArquitetonico/projetoArquitetonico_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  ProjetoArquitetonicoController projetoarquitetonico;

  setUp(() {
    projetoarquitetonico = HomeModule.to.get<ProjetoArquitetonicoController>();
  });

  group('ProjetoArquitetonicoController Test', () {
    test("First Test", () {
      expect(
          projetoarquitetonico, isInstanceOf<ProjetoArquitetonicoController>());
    });

    test("Set Value", () {
      expect(projetoarquitetonico.value, equals(0));
      projetoarquitetonico.increment();
      expect(projetoarquitetonico.value, equals(1));
    });
  });
}

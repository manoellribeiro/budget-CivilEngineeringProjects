import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/levantamentoCadastral/levantamentoCadastral_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  LevantamentoCadastralController levantamentocadastral;

  setUp(() {
    levantamentocadastral =
        HomeModule.to.get<LevantamentoCadastralController>();
  });

  group('LevantamentoCadastralController Test', () {
    test("First Test", () {
      expect(levantamentocadastral,
          isInstanceOf<LevantamentoCadastralController>());
    });

    test("Set Value", () {
      expect(levantamentocadastral.value, equals(0));
      levantamentocadastral.increment();
      expect(levantamentocadastral.value, equals(1));
    });
  });
}

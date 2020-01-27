import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:precificacaodeprojetos/app/modules/home/pages/info/info_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  InfoController info;

  setUp(() {
    info = HomeModule.to.get<InfoController>();
  });

  group('InfoController Test', () {
    test("First Test", () {
      expect(info, isInstanceOf<InfoController>());
    });

    test("Set Value", () {
      expect(info.value, equals(0));
      info.increment();
      expect(info.value, equals(1));
    });
  });
}

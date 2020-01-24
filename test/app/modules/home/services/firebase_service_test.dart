import 'package:flutter_test/flutter_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/services/firebase_service.dart';

void main() {
  FirebaseService service;

  setUp(() {
    service = FirebaseService();
  });

  group('FirebaseService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<FirebaseService>());
    });
  });
}

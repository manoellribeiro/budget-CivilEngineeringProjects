import 'package:flutter_test/flutter_test.dart';

import 'package:precificacaodeprojetos/app/modules/home/services/notifications_service.dart';

void main() {
  NotificationsService service;

  setUp(() {
    service = NotificationsService();
  });

  group('NotificationsService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<NotificationsService>());
    });
  });
}

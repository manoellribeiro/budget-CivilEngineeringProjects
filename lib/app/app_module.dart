import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:precificacaodeprojetos/app/app_widget.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';

import 'core/services/firebase_service.dart';
import 'core/services/local_storage_service.dart';
import 'core/services/notifications_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LocalStorageService()),
        Bind((i) => NotificationsService()),
        Bind((i) => FirebaseService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

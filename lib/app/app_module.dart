import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:precificacaodeprojetos/app/app_widget.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_module.dart';
import 'package:precificacaodeprojetos/app/modules/home/services/local_storage_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LocalStorageService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

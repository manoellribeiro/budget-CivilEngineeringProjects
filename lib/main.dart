import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:precificacaodeprojetos/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final localDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(localDirectory.path);
  final hiveBox = await Hive.openBox('budgetsBox');
  runApp(ModularApp(module: AppModule()));}

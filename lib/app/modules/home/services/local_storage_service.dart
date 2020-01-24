import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';

class LocalStorageService extends Disposable {



  Completer<Box> completer = Completer<Box>();

  LocalStorageService(){
    _initializeLocalDataBase();
  }

  _initializeLocalDataBase() async{
    final localDirectory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(localDirectory.path);
    final hiveBox = await Hive.openBox('budgetsBox');
    if (!completer.isCompleted) completer.complete(hiveBox);
  }


  Future<List<BudgetModel>> getAllBudgets() async{
    final budgetsBox = await completer.future;
    return budgetsBox.values;
  }



  Future<BudgetModel> add(BudgetModel budget) async{
    final budgetsBox = await completer.future;
    budget.id = budgetsBox.values.length;
    budgetsBox.put(budgetsBox.values.length, budget.toJson());
    return budget;
  }

  removeOneBudget(int id)async{
    final budgetsBox = Hive.box('budgetsBox');
    await budgetsBox.delete(id);
  }


  @override
  void dispose() {

  }
}

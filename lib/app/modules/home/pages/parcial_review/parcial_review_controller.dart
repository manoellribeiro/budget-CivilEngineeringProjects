import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:precificacaodeprojetos/app/core/services/local_storage_service.dart';
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';

part 'parcial_review_controller.g.dart';

class ParcialReviewController = _ParcialReviewBase
    with _$ParcialReviewController;

abstract class _ParcialReviewBase with Store {

  final LocalStorageService service = LocalStorageService();

  @observable
  String clientName;

  @action
  changeClientName(String value) => clientName = value;

  String validateArea(){
    if (clientName == null || clientName.isEmpty){
      return "Campo obrigatorio";
    }else if(clientName.length < 3){
      return "Insira um nome válido";
    }else{
      return null;
    }
  }

  @computed
  bool get validateForm{
    if (validateArea() == null){
      return true;
    }else{
      return false;
    }
  }

  init()async{
    final allList = await service.getAllBudgets();
    list.addAll(allList);
  }

    @observable
    ObservableList<BudgetModel> list = ObservableList<BudgetModel>();
}

import 'package:mobx/mobx.dart';

part 'budgets_view_controller.g.dart';

class BudgetsViewController = _BudgetsViewBase with _$BudgetsViewController;

abstract class _BudgetsViewBase with Store {

  @observable
  bool isVisible = false;

  @action
  void changeIsVisible(){
    if(isVisible == false){
      isVisible = true;
    }else if(isVisible == true){
      isVisible = false;
    }
  }

}

import 'package:mobx/mobx.dart';

part 'info_controller.g.dart';

class InfoController = _InfoBase with _$InfoController;

abstract class _InfoBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

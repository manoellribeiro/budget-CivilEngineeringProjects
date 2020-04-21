import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


part 'levantamentoCadastral_controller.g.dart';

class LevantamentoCadastralController = _LevantamentoCadastralBase
    with _$LevantamentoCadastralController;

abstract class _LevantamentoCadastralBase with Store {

  double estimateValue;
  double pricePerSquareMeter = 5;
  double transportCosts = 90;
  double plotingCosts = 50;
  double othersCosts = 90;
  double fixCosts = 150;
  double constructedAreaIndex = 1;

  @observable
  String areaValue;

  @action
  changeArea(String value) => areaValue = value;

  @observable
  bool thereIsConstructedArea = true;

  @action
  void changeThereIsConstructedArea(bool value) => thereIsConstructedArea = value;

  void thereIsConstructedAreaMethod() => thereIsConstructedArea ? constructedAreaIndex = 1 : constructedAreaIndex = 0.6;

  @action
  void calculatePrice(){
    double area = double.parse(areaValue);
    estimateValue = double.parse((((area*pricePerSquareMeter) + (area*pricePerSquareMeter*0.01) + transportCosts + plotingCosts + fixCosts + (area*pricePerSquareMeter)*0.05)* constructedAreaIndex).toStringAsFixed(2));
  }

  String validateArea(){
    if (areaValue == null || areaValue.isEmpty){
      return "Campo obrigatorio";
    }else if(double.tryParse(areaValue) < 10){
      return "Insira uma área válida";
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


}

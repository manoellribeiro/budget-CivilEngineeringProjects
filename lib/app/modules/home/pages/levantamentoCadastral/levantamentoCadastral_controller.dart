import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


part 'levantamentoCadastral_controller.g.dart';

class LevantamentoCadastralController = _LevantamentoCadastralBase
    with _$LevantamentoCadastralController;

abstract class _LevantamentoCadastralBase with Store {

  double estimateValue;
  double pricePerSquareMeter = 4;
  double transportCosts = 50;
  double plotingCosts = 40;
  double othersCosts = 90;
  double fixCosts = 70;


  @observable
  String areaValue;

  @action
  changeArea(String value) => areaValue = value;



  @action
  void calculatePrice(BuildContext context){
    double area = double.parse(areaValue);
    estimateValue = (area*pricePerSquareMeter) + transportCosts + plotingCosts + fixCosts;
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

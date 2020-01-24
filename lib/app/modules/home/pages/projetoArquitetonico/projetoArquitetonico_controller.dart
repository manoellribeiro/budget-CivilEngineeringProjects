import 'package:mobx/mobx.dart';

part 'projetoArquitetonico_controller.g.dart';

class ProjetoArquitetonicoController = _ProjetoArquitetonicoBase
    with _$ProjetoArquitetonicoController;

abstract class _ProjetoArquitetonicoBase with Store {

  double estimateValue;
  double pricePerSquareMeter = 12;
  double transportCosts = 50;
  double plotingCosts = 40;
  double othersCosts = 90;
  double fixCosts = 70;
  double howMuchFloorsIndex = 1;
  double buildingStandardIndex = 1.0;
  double quantitativeIndex = 1.0;


  @observable
  String areaValue;

  @action
  changeArea(String value) => areaValue = value;



  var floorTypes = ["Edificação Térrea", "Edificação com 1 à 3 Pavimentos", "Edificação com 4 ou mais pavimentos"];
  var standardTypes = ["Baixo", "Médio", "Alto", "Comercial", "Industrial"];


  @observable
  String hintText = "Escolha o número de pavimentos";

  @action
  void floorIndexMethod(){
    if (hintText == "Edificação Térrea"){
      howMuchFloorsIndex = 1;
    } else if (hintText == "Edificação com 1 à 3 Pavimentos"){
      howMuchFloorsIndex = 1.2;
    } else if (hintText == "Edificação com 4 ou mais pavimentos"){
      howMuchFloorsIndex = 1.2;
    }
  }


  @observable
  bool quantitativeOfMaterials = false;

  @action
  void changeQuantitative(bool value)=> quantitativeOfMaterials = value;

  void quantitativeMethod (){
    if (quantitativeOfMaterials == true){
      quantitativeIndex = 1.0;
    } else{
      quantitativeIndex = 1.5;
    }
  }


  @observable
  String hintText2 = "Escolha o padrão da edificação";

  @action
  void standardIndexMethod (){
    if (hintText2 == "Baixo"){
      buildingStandardIndex = 1;
    } else if (hintText2 == "Médio"){
      buildingStandardIndex = 1.3;
    } else if (hintText2 == "Alto"){
      buildingStandardIndex = 1.4;
    } else if (hintText2 == "Comercial"){
      buildingStandardIndex = 1.3;
    } else if (hintText2 == "Industrial"){
      buildingStandardIndex = 1.5;
    }
  }

  @observable
  String infoText = "Informe os dados para precificação";

  @action
  void calculatePrice(){
    double area = double.parse(areaValue);
    estimateValue = (area*pricePerSquareMeter*howMuchFloorsIndex*quantitativeIndex*buildingStandardIndex) + transportCosts + plotingCosts + othersCosts + fixCosts;
    infoText = "A estimativa de preço é $estimateValue reais";

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

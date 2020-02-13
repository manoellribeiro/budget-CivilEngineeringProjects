import 'package:mobx/mobx.dart';

part 'projetoEletrico_controller.g.dart';

class ProjetoEletricoController = _ProjetoEletricoBase
    with _$ProjetoEletricoController;

abstract class _ProjetoEletricoBase with Store {


  double estimateValue;
  double pricePerSquareMeter = 7;
  double transportCosts = 90;
  double plotingCosts = 50;
  double othersCosts = 90;
  double fixCosts = 150;
  double distributionPanelsIndex = 1.0;
  double propertyStandardIndex = 1.0;
  double thereIsFloorPlanIndex = 1.0;


  var distributionPanels = ["1","2","3+"];

  var propertyStandard = [
    "Baixo",
    "Médio",
    "Alto",
    "Comercial",
    "Industrial"];

  @observable
  String areaValue;

  @action
  changeArea(String value) => areaValue = value;


  @observable
  String hintText = "Número de Quadros de Distribuição";

  @action
  void howMuchDistributionPanels (){
    if (hintText == "1"){
      distributionPanelsIndex = 1;
    } else if (hintText == "2"){
      distributionPanelsIndex = 1.4;
    } else if (hintText == "3+"){
      distributionPanelsIndex = 1.8;
    }
  }


  @observable
  String hintText2 = "Padrão da Edificação";

  @action
  void standardIndexMethod(){
    if (hintText2 == "Baixo"){
      propertyStandardIndex = 1;
    } else if (hintText2 == "Médio"){
      propertyStandardIndex = 1.6;
    } else if (hintText2 == "Alto"){
      propertyStandardIndex = 1.9;
    } else if (hintText2 == "Comercial"){
      propertyStandardIndex = 1.7;
    } else if (hintText2 == "Industrial"){
      propertyStandardIndex = 2;
    }
  }

  @observable
  bool thereIsFloorPlan = false;

  @action
  void changeThereIsFloorPlan(bool value)=> thereIsFloorPlan = value;


  void thereIsFloorPlanMethod(){
    if(thereIsFloorPlan == true){
      thereIsFloorPlanIndex = 0.8;
    }else {
      thereIsFloorPlanIndex = 1.0;
    }
  }


  @action
  void calculatePrice(){
    double area = double.parse(areaValue);
    estimateValue = double.parse(((area*pricePerSquareMeter*distributionPanelsIndex*thereIsFloorPlanIndex*propertyStandardIndex) + (area*pricePerSquareMeter*0.01)+ (area*pricePerSquareMeter*0.05) + transportCosts + plotingCosts + othersCosts + fixCosts).toStringAsFixed(2));
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

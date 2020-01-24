import 'package:mobx/mobx.dart';

part 'projetoEletrico_controller.g.dart';

class ProjetoEletricoController = _ProjetoEletricoBase
    with _$ProjetoEletricoController;

abstract class _ProjetoEletricoBase with Store {


  double estimateValue;
  double pricePerSquareMeter = 5;
  double transportCosts = 50;
  double plotingCosts = 40;
  double othersCosts = 90;
  double fixCosts = 70;
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
      distributionPanelsIndex = 1.2;
    } else if (hintText == "3+"){
      distributionPanelsIndex = 1.3;
    }
  }


  @observable
  String hintText2 = "Padrão da Edificação";

  @action
  void standardIndexMethod(){
    if (hintText2 == "Baixo"){
      propertyStandardIndex = 1;
    } else if (hintText2 == "Médio"){
      propertyStandardIndex = 1.3;
    } else if (hintText2 == "Alto"){
      propertyStandardIndex = 1.4;
    } else if (hintText2 == "Comercial"){
      propertyStandardIndex = 1.3;
    } else if (hintText2 == "Industrial"){
      propertyStandardIndex = 1.5;
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

  @observable
  String infoText = "Informe os dados para precificação";

  @action
  void calculatePrice(){
    double area = double.parse(areaValue);
    estimateValue = (area*4*distributionPanelsIndex*thereIsFloorPlanIndex*propertyStandardIndex) + transportCosts + plotingCosts + othersCosts + fixCosts;
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

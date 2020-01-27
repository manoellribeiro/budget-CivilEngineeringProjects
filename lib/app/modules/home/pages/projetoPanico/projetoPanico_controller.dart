import 'package:mobx/mobx.dart';

part 'projetoPanico_controller.g.dart';

class ProjetoPanicoController = _ProjetoPanicoBase
    with _$ProjetoPanicoController;

abstract class _ProjetoPanicoBase with Store {


  double estimateValue;
  double pricePerSquareMeter = 4.5;
  double transportCosts = 50;
  double plotingCosts = 40;
  double othersCosts = 90;
  double fixCosts = 70;


  double propertyStandardIndex = 1;
  double thereIsFloorPlanIndex = 1.0;


  double projectOfSPADIndex = 1;

  double budgetAndQuantityIndex = 1;



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
  String hintText = "Padrão da Edificação";

  @action
  void whatIsThePropertyStandard(){
    if (hintText == "Baixo"){
      propertyStandardIndex = 1;
    } else if (hintText == "Médio"){
      propertyStandardIndex = 1.3;
    } else if (hintText == "Alto"){
      propertyStandardIndex = 1.4;
    } else if (hintText == "Comercial"){
      propertyStandardIndex = 1.3;
    } else if (hintText == "Industrial"){
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
  bool projectOfSPDA = false;

  @action
  void changeProjectOfSPDA(bool value)=> projectOfSPDA = value;


  void thereIsProjectOfSPDA(){
    if(projectOfSPDA == true){
      projectOfSPADIndex = 1.5;
    }else {
      projectOfSPADIndex = 1.0;
    }
  }


  @observable
  bool thereIsQuantity = false;

  @action
  void changeThereIsQuantity(bool value)=> thereIsQuantity = value;


  void thereIsQuantityMethod(){
    if(thereIsQuantity == true){
      budgetAndQuantityIndex = 1.5;
    }else {
      budgetAndQuantityIndex = 1.0;
    }
  }


  @action
  void calculatePrice() {
    double area = double.parse(areaValue);
    estimateValue = (area*(pricePerSquareMeter)*thereIsFloorPlanIndex*propertyStandardIndex*projectOfSPADIndex*budgetAndQuantityIndex) + transportCosts + plotingCosts + othersCosts + fixCosts;
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

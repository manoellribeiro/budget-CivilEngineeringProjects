import 'package:mobx/mobx.dart';

part 'projetoPanico_controller.g.dart';

class ProjetoPanicoController = _ProjetoPanicoBase
    with _$ProjetoPanicoController;

abstract class _ProjetoPanicoBase with Store {

  double estimateValue;
  double pricePerSquareMeter = 4.0;
  double transportCosts = 90;
  double plotingCosts = 50;
  double othersCosts = 90;
  double fixCosts = 150;
  double propertyStandardIndex = 1;
  double thereIsFloorPlanIndex = 1.0;
  double projectOfSPADIndex = 1;
  double orientationTax = 1;

  var propertyStandard = [
    "Baixo",
    "Médio",
    "Alto",
    "Comercial",
    "Industrial"
    ];

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
      propertyStandardIndex = 1.6;
    } else if (hintText == "Alto"){
      propertyStandardIndex = 1.9;
    } else if (hintText == "Comercial"){
      propertyStandardIndex = 1.7;
    } else if (hintText == "Industrial"){
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

  @observable
  bool projectOfSPDA = false;

  @action
  void changeProjectOfSPDA(bool value)=> projectOfSPDA = value;

  void thereIsProjectOfSPDA(){
    if(projectOfSPDA == true){
      projectOfSPADIndex = 2;
    }else {
      projectOfSPADIndex = 1.0;
    }
  }

  @observable
  bool thereIsOrientationTax = false;

  @action
  void changeThereIsOrientationTax(bool value) => thereIsOrientationTax = value;

  void thereIsOrientationTaxMethod() => thereIsOrientationTax ? orientationTax = 1.3 : orientationTax = 1;
    
  @action
  void calculatePrice() {
    double area = double.parse(areaValue);
    estimateValue = double.parse((((area*pricePerSquareMeter*thereIsFloorPlanIndex*propertyStandardIndex*projectOfSPADIndex) + (area*pricePerSquareMeter*0.05)+ (area*pricePerSquareMeter*0.01) + transportCosts + plotingCosts + othersCosts + fixCosts) * orientationTax).toStringAsFixed(2));
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

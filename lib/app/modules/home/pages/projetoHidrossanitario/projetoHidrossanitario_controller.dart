import 'package:mobx/mobx.dart';

part 'projetoHidrossanitario_controller.g.dart';

class ProjetoHidrossanitarioController = _ProjetoHidrossanitarioBase
    with _$ProjetoHidrossanitarioController;

abstract class _ProjetoHidrossanitarioBase with Store {
  double estimateValue;
  double pricePerSquareMeter = 9;
  double transportCosts = 90;
  double plotingCosts = 50;
  double othersCosts = 90;
  double fixCosts = 150;


  double propertyStandardIndex = 1;
  double quantityOfWetAreasIndex = 1.2;
  double thereIsFloorPlanIndex = 1.0;
  double projectOfHotWaterIndex = 1;
  double projectOfReuseOfWaterIndex = 1;



  var quantityOfWetAreas = ["De 1 à 3","De 3 à 5","Maior que 5"];
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
  String hintText = "Número de Áreas Molhadas";

  @action
  void quantityOfWetAreasMethod (){
    if (hintText == "De 1 à 3"){
      quantityOfWetAreasIndex = 1.2;
    } else if (hintText == "De 3 à 5"){
      quantityOfWetAreasIndex = 1.7;
    } else if (hintText == "Maior que 5"){
      quantityOfWetAreasIndex = 1.9;
    }

  }

  @observable
  String hintText2 = "Padrão da Edificação";

  @action
  void whatIsThePropertyStandard(){
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

  @observable
  bool projectOfHotWater = false;

  @action
  void changeProjectOfHotWater(bool value)=> projectOfHotWater = value;


  void projectOfHotWaterMethod(){
    if(projectOfHotWater == true){
      projectOfHotWaterIndex = 1.5;
    }else {
      projectOfHotWaterIndex = 1.0;
    }
  }

  @observable
  bool projectOfReuseOfWater = false;

  @action
  void changeProjectOfReuse(bool value)=> projectOfReuseOfWater = value;


  void projectOfReuseOfWaterMethod(){
    if(projectOfReuseOfWater == true){
      projectOfReuseOfWaterIndex = 1.7;
    }else {
      projectOfReuseOfWaterIndex = 1.0;
    }
  }

  @action
  void calculatePrice() {
    double area = double.parse(areaValue);
    estimateValue = double.parse(((area*pricePerSquareMeter*quantityOfWetAreasIndex*thereIsFloorPlanIndex*propertyStandardIndex*projectOfHotWaterIndex*projectOfReuseOfWaterIndex)+ (area*pricePerSquareMeter*0.05)+ (area*pricePerSquareMeter*0.01) + transportCosts + plotingCosts + othersCosts + fixCosts).toStringAsFixed(2));
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

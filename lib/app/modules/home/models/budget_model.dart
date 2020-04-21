class BudgetModel {
  
  String name;
  String imageLocation;
  double estimateValue;
  double transportCosts;
  double plotingCosts;
  double othersCosts;
  double fixCosts;
  int id;

  BudgetModel({this.name,
      this.imageLocation,
      this.estimateValue,
      this.transportCosts,
      this.plotingCosts,
      this.othersCosts,
      this.fixCosts,
      this.id
  });

  factory BudgetModel.fromJson(Map<dynamic, dynamic> json) {
    return BudgetModel(
        name: json['name'],
        imageLocation: json['imageLocation'],
        estimateValue: json['estimateValue'],
        transportCosts: json['transportCosts'],
        plotingCosts: json['plotingCosts'],
        othersCosts: json['othersCosts'],
        fixCosts: json['fixCosts'],
        id: json['id']
        );
  }

  toJson(){
    return {
      'name': name,
      'imageLocation': imageLocation,
      'estimateValue': estimateValue,
      'transportCosts': transportCosts,
      'plotingCosts': plotingCosts,
      'othersCosts': othersCosts,
      'fixCosts': fixCosts,
      'id': id
    };
  }
}

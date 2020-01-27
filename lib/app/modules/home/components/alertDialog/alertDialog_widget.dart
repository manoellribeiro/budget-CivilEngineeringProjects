import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';
import 'package:precificacaodeprojetos/app/modules/home/services/local_storage_service.dart';

class AlertDialogWidget extends StatelessWidget {
  final LocalStorageService service;
  final BudgetModel budgetModel;
  final String title;
  final String imageLocation;
  final double transportationCost;
  final double plotingCost;
  final double othersCost;
  final double fixCost;
  final String routeName;
  final double estimateValue;

  const AlertDialogWidget(
    this.service,
    this.budgetModel,
    this.title,
    this.imageLocation,
    this.transportationCost,
    this.plotingCost,
    this.othersCost,
    this.fixCost,
    this.routeName,
    this.estimateValue);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(10),
      title: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xff42a44f),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          ),
          child: Center(child: FlareActor("images/Check.flr", animation: "Untitled",)) ),
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text("Preço Total"),
                subtitle: Text("$estimateValue reais"),
              ),
              Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              Center(child: Text("Custos")),
              Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text("Transporte"),
                subtitle: Text("$transportationCost reais"),
              ),
              ListTile(
                leading: Icon(Icons.print),
                title: Text("Impressão"),
                subtitle: Text("$plotingCost reais"),
              ),
              ListTile(
                leading: Icon(Icons.class_),
                title: Text("Outros"),
                subtitle: Text("$othersCost reais"),
              ),ListTile(
                leading: Icon(Icons.business),
                title: Text("Fixos"),
                subtitle: Text("$fixCost reais"),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Refazer"),
          onPressed: (){
            Navigator.pop(context, routeName);
          },
        ),
        FlatButton(
          child: Text("Salvar e continuar precificando"),
          onPressed: (){
            budgetModel.name = title;
            budgetModel.imageLocation = imageLocation;
            budgetModel.estimateValue = estimateValue;
            budgetModel.transportCosts = transportationCost;
            budgetModel.plotingCosts = plotingCost;
            budgetModel.othersCosts = othersCost;
            budgetModel.fixCosts = fixCost;
            service.add(budgetModel);
            Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route)=> false);
          },
        ),
        FlatButton(
          child: Text("Salvar e ir pro relatório parcial"),
          onPressed: (){
            budgetModel.name = title;
            budgetModel.imageLocation = imageLocation;
            budgetModel.estimateValue = estimateValue;
            budgetModel.transportCosts = transportationCost;
            budgetModel.plotingCosts = plotingCost;
            budgetModel.othersCosts = othersCost;
            budgetModel.fixCosts = fixCost;
            service.add(budgetModel);
            Navigator.of(context).pushNamedAndRemoveUntil('/parcialReview', (Route<dynamic> route)=> false);
          },
        )
      ],
    );
  }
}

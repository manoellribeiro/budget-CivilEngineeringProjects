import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:precificacaodeprojetos/app/core/services/local_storage_service.dart';
import 'package:precificacaodeprojetos/app/modules/home/components/alertDialog/alertDialog_widget.dart';
import 'package:precificacaodeprojetos/app/modules/home/components/textField/textField_widget.dart';
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoEletrico/projetoEletrico_controller.dart';

class ProjetoEletricoPage extends StatefulWidget {
  final String title;
  const ProjetoEletricoPage({Key key, this.title = "Projeto Eletrico"})
      : super(key: key);

  @override
  _ProjetoEletricoPageState createState() => _ProjetoEletricoPageState();
}

class _ProjetoEletricoPageState extends State<ProjetoEletricoPage> {

  final controller = ProjetoEletricoController();
  final service = LocalStorageService();
  final budget = BudgetModel();

  _showDialog(){
    return showDialog(
        context: context,
        builder: (_){
          return AlertDialogWidget(service,
            budget,
            "Projeto Elétrico",
            'images/eletrico.png',
            controller.transportCosts,
            controller.plotingCosts,
            controller.othersCosts,
            controller.fixCosts,
            '/eletrico',
            controller.estimateValue,
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        backgroundColor: Color(0xff32425d),
        title: Text("Projeto Elétrico"),
        centerTitle: true,),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: "eletricoTag",
                  child: SizedBox(
                    child: Image.asset('images/eletrico.png'),
                    width: screenWidht*0.1,
                    height: screenHeight*0.2
                    ),
                ),
                Observer(
                  builder: (_){
                    return DropdownButton<String>(
                        hint: Text(controller.hintText),
                        icon: Icon(Icons.arrow_drop_down),
                        items: controller.distributionPanels.map((String dropDownStringItem){
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.hintText = value;
                          controller.howMuchDistributionPanels();
                        }
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Observer(
                    builder: (_){
                      return DropdownButton<String>(
                          hint: Text(controller.hintText2),
                          icon: Icon(Icons.arrow_drop_down),
                          items: controller.propertyStandard.map((String dropDownStringItem){
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.hintText2 = value;
                            controller.standardIndexMethod();
                          }
                      );
                    },
                  ),
                ),
                Observer(
                  builder: (_){
                    return CheckboxListTile(
                      value: controller.thereIsFloorPlan,
                      title: Text("Já possui as plantas?", style: TextStyle(fontSize: 15.0),),
                      onChanged: (value){
                        controller.changeThereIsFloorPlan(value);
                        controller.thereIsFloorPlanMethod();
                      },
                    );
                  },
                ),
                Observer(
                  builder: (_){
                    return TextFieldWidget(
                        "Área (m²)", controller.validateArea(), controller.changeArea, TextInputType.number);
                  },
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Observer(
                    builder: (_){
                      return Container(
                        height: screenHeight*0.08,
                        child: RaisedButton(
                          color: Color(0xff32425d),
                          disabledColor: Colors.grey,
                          onPressed: controller.validateForm?() {
                            controller.calculatePrice();
                            _showDialog();
                          }: null,
                          child: Text("Calcular",
                              style:
                              TextStyle(color: Colors.white, fontSize: 25)),
                        ),
                      );
                    },
                  )
                ),
              ],
            ),
          )),
    );
  }
}

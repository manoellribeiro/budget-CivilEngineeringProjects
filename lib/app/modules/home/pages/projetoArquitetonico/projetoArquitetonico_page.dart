import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:precificacaodeprojetos/app/modules/home/components/alertDialog/alertDialog_widget.dart';
import 'package:precificacaodeprojetos/app/modules/home/components/textField/textField_widget.dart';
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoArquitetonico/projetoArquitetonico_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/services/local_storage_service.dart';

class ProjetoArquitetonicoPage extends StatefulWidget {
  final String title;
  const ProjetoArquitetonicoPage({Key key, this.title = "Projeto Arquitetônico"})
      : super(key: key);

  @override
  _ProjetoArquitetonicoPageState createState() =>
      _ProjetoArquitetonicoPageState();
}

class _ProjetoArquitetonicoPageState extends State<ProjetoArquitetonicoPage> {

  final controller = ProjetoArquitetonicoController();
  final service = LocalStorageService();
  final budget = BudgetModel();

  _showDialog(){
    return showDialog(
        context: context,
        builder: (_){
          return AlertDialogWidget(service,
            budget,
            "Projeto Arquitetônico",
            'images/arquitetonico.png',
            controller.transportCosts,
            controller.plotingCosts,
            controller.othersCosts,
            controller.fixCosts,
            '/arquitetonico',
            controller.estimateValue,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        backgroundColor: Color(0xff32425d),
        title: Text("Projeto Arquitetônico"),
        centerTitle: true,),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(child: Image.asset('images/arquitetonico.png'), width: screenWidht*0.1, height: screenHeight*0.2,),
                Observer(
                  builder: (_){
                    return DropdownButton<String>(
                        hint: Text(controller.hintText),
                        icon: Icon(Icons.arrow_drop_down),
                        items: controller.floorTypes.map((String dropDownStringItem){
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.hintText = value;
                          controller.floorIndexMethod();
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
                          items: controller.standardTypes.map((String dropDownStringItem){
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
                  )
                ),
                Observer(
                  builder: (_){
                    return CheckboxListTile(
                      value: controller.quantitativeOfMaterials,
                      title: Text("Quantitativo de Materiais?", style: TextStyle(fontSize: 15.0),),
                      onChanged: (value){
                        controller.quantitativeMethod();
                        controller.changeQuantitative(value);
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
                          onPressed: controller.validateForm? () {
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

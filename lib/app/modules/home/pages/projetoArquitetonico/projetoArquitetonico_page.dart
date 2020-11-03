import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:precificacaodeprojetos/app/core/assets/images/Images.dart';
import 'package:precificacaodeprojetos/app/core/components/alertDialog/alertDialog_widget.dart';
import 'package:precificacaodeprojetos/app/core/components/textField/textField_widget.dart';
import 'package:precificacaodeprojetos/app/core/services/local_storage_service.dart';
import 'package:precificacaodeprojetos/app/core/values/strings.dart';
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoArquitetonico/projetoArquitetonico_controller.dart';

class ProjetoArquitetonicoPage extends StatefulWidget {

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
            Strings.projetoArquitetonico,
            Images.arquitetonicoIllustration,
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
        title: Text(Strings.projetoArquitetonico),
        centerTitle: true,),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: "arquitetonicoTag",
                  child: SizedBox(
                    child: Image.asset(Images.arquitetonicoIllustration),
                    width: screenWidht*0.1,
                    height: screenHeight*0.2,),
                ),
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
                      title: Text(Strings.materialQuantitative, style: TextStyle(fontSize: 15.0),),
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
                        Strings.area, controller.validateArea(), controller.changeArea, TextInputType.number);
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
                          child: Text(Strings.calculateButton,
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

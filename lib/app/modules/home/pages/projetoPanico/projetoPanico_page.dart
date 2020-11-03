import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:precificacaodeprojetos/app/core/assets/images/Images.dart';
import 'package:precificacaodeprojetos/app/core/components/alertDialog/alertDialog_widget.dart';
import 'package:precificacaodeprojetos/app/core/components/textField/textField_widget.dart';
import 'package:precificacaodeprojetos/app/core/services/local_storage_service.dart';
import 'package:precificacaodeprojetos/app/core/values/strings.dart';
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoPanico/projetoPanico_controller.dart';

class ProjetoPanicoPage extends StatefulWidget {
  @override
  _ProjetoPanicoPageState createState() => _ProjetoPanicoPageState();
}

class _ProjetoPanicoPageState extends State<ProjetoPanicoPage> {
  final controller = ProjetoPanicoController();
  final service = LocalStorageService();
  final budget = BudgetModel();

  _showDialog() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialogWidget(
            service,
            budget,
            Strings.panicoIncendio,
            Images.panicoIllustration,
            controller.transportCosts,
            controller.plotingCosts,
            controller.othersCosts,
            controller.fixCosts,
            '/panico',
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
        title: Text(Strings.panicoIncendio),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "panicoTag",
                child: SizedBox(
                    child: Image.asset(Images.panicoIllustration),
                    width: screenWidht * 0.1,
                    height: screenHeight * 0.2),
              ),
              Observer(
                builder: (_) {
                  return CheckboxListTile(
                    value: controller.projectOfSPDA,
                    title: Text(
                      Strings.spda,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onChanged: (value) {
                      controller.changeProjectOfSPDA(value);
                      controller.thereIsProjectOfSPDA();
                    },
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return CheckboxListTile(
                    value: controller.thereIsOrientationTax,
                    title: Text(
                      Strings.orientationTax,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onChanged: (value) {
                      controller.changeThereIsOrientationTax(value);
                      controller.thereIsOrientationTaxMethod();
                    },
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return CheckboxListTile(
                    value: controller.thereIsFloorPlan,
                    title: Text(
                      Strings.hasConstructionsPlans,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onChanged: (value) {
                      controller.changeThereIsFloorPlan(value);
                      controller.thereIsFloorPlanMethod();
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Observer(
                  builder: (_) {
                    return DropdownButton<String>(
                        hint: Text(controller.hintText),
                        icon: Icon(Icons.arrow_drop_down),
                        items: controller.propertyStandard
                            .map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.hintText = value;
                          controller.whatIsThePropertyStandard();
                        });
                  },
                ),
              ),
              Observer(
                builder: (_) {
                  return TextFieldWidget(
                      Strings.area,
                      controller.validateArea(),
                      controller.changeArea,
                      TextInputType.number);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Observer(
                  builder: (_) {
                    return Container(
                      height: screenHeight * 0.08,
                      child: RaisedButton(
                        color: Color(0xff32425d),
                        disabledColor: Colors.grey,
                        onPressed: controller.validateForm
                            ? () {
                                controller.calculatePrice();
                                _showDialog();
                              }
                            : null,
                        child: Text(
                          Strings.calculateButton,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

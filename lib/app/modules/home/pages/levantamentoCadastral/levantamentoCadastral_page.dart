import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:precificacaodeprojetos/app/core/assets/images/Images.dart';
import 'package:precificacaodeprojetos/app/core/components/alertDialog/alertDialog_widget.dart';
import 'package:precificacaodeprojetos/app/core/components/textField/textField_widget.dart';
import 'package:precificacaodeprojetos/app/core/services/local_storage_service.dart';
import 'package:precificacaodeprojetos/app/core/values/strings.dart';
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/levantamentoCadastral/levantamentoCadastral_controller.dart';

class LevantamentoCadastralPage extends StatefulWidget {
  @override
  _LevantamentoCadastralPageState createState() =>
      _LevantamentoCadastralPageState();
}

class _LevantamentoCadastralPageState extends State<LevantamentoCadastralPage> {
  final controller = LevantamentoCadastralController();
  final service = LocalStorageService();
  final budget = BudgetModel();

  _showDialog() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialogWidget(
            service,
            budget,
            Strings.levantamentoCadastral,
            Images.levantamentoIllustration,
            controller.transportCosts,
            controller.plotingCosts,
            controller.othersCosts,
            controller.fixCosts,
            '/levantamento',
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
        title: Text(Strings.levantamentoCadastral),
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
                  tag: "levantamentoTag",
                  child: SizedBox(
                      child: Image.asset(Images.levantamentoIllustration),
                      width: screenWidht * 0.1,
                      height: screenHeight * 0.2),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                Observer(
                  builder: (_) {
                    return CheckboxListTile(
                      value: controller.thereIsConstructedArea,
                      title: Text(
                        Strings.requiredField,
                        style: TextStyle(fontSize: 15.0),
                      ),
                      onChanged: (value) {
                        controller.changeThereIsConstructedArea(value);
                        controller.thereIsConstructedAreaMethod();
                      },
                    );
                  },
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
                  child: Container(
                      height: screenHeight * 0.08,
                      child: Observer(
                        builder: (_) {
                          return RaisedButton(
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
                          );
                        },
                      )),
                ),
              ],
            ),
          )),
    );
  }
}

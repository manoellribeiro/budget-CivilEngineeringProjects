import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:precificacaodeprojetos/app/modules/home/components/textField/textField_widget.dart';
import 'package:precificacaodeprojetos/app/modules/home/services/firebase_service.dart';
import 'package:precificacaodeprojetos/app/modules/home/services/notifications_service.dart';

class FirebaseAlertDialogWidget extends StatefulWidget {


  @override
  _FirebaseAlertDialogWidgetState createState() => _FirebaseAlertDialogWidgetState();
}

class _FirebaseAlertDialogWidgetState extends State<FirebaseAlertDialogWidget> {
  final service = FirebaseService();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final budgetsBox = Hive.box('budgetsBox');
  TextEditingController textController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  void sendNotification() async{
    final response = await NotificationsService.sendToAll(
        title: "Nova precificação realizada",
        body: "Venha conferir a precificação de ${service.clientName}");
  }


  @override
  void initState() {
    super.initState();

    _firebaseMessaging.subscribeToTopic("all");

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      title: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xff42a44f),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
          ),
          child: Center(child: Text("Deseja Salvar a precificação?", style: TextStyle(color: Colors.white, fontSize: 20),)) ),
      content: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value){
            if(value.isEmpty){
              return "Digite um nome";
            }else if(value.length < 3) {
              return "Digite um nome válido";
            }else{
              return null;
            }
          },
          controller: textController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            prefixIcon: Container(
              child: Icon(Icons.perm_identity, color: Colors.white),
              decoration: BoxDecoration(
                  color: Color(0xff32425d),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )
              ),
            ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              labelText: "Cliente",
              labelStyle: TextStyle(color: Colors.grey , fontSize: 15.0)),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25.0, color: Color(0xff42a44f)),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Não"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        FlatButton(
            child: Text("Sim"),
            onPressed: (){
              if(_formKey.currentState.validate()){
                service.clientName = textController.text;
                int i = 0;
                while(i < budgetsBox.values.length){
                  service.addData(i);
                  i++;
                }
                sendNotification();
                Navigator.pushReplacementNamed(context, '/budgetView');
              }
            }
        ),
      ],
    );
  }
}


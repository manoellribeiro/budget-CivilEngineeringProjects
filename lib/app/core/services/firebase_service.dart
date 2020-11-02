import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

class FirebaseService extends Disposable {

  String clientName;
  final Firestore firestore = Firestore.instance;
  final budgetsBox = Hive.box('budgetsBox');

  Future addData(int i) async{
    DocumentReference doc = await firestore.collection("Precificações").document(clientName);
    doc.setData({
      'howMuchProjects': budgetsBox.values.length,
      'clientName': clientName,
      'Precificação $i': budgetsBox.get(i),
    }, merge: true);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

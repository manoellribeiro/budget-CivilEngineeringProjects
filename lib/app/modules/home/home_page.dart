import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:precificacaodeprojetos/app/modules/home/components/menuItem/menuItem_widget.dart';



class HomePage extends StatefulWidget {
  final String title;
  const HomePage(
      {Key key, this.title = "Precificação - Engetec"})
      : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    _firebaseMessaging.subscribeToTopic('all');

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {

      },
      onLaunch: (Map<String, dynamic> message) async {

      },
      onResume: (Map<String, dynamic> message) async {
      },
    );
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Container(
        height: screenHeight,
        width: 100,
        color: Color(0xff32425d),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white,),
              onPressed: (){
              },
            ),
            Text("Página Principal", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
            IconButton(
              icon: Icon(Icons.assessment, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/parcialReview');
              },
            ),
            Text("Relatório Parcial", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
            IconButton(
              icon: Icon(Icons.playlist_add_check, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/budgetView');
              },
            ),
            Text("Precificações Concluídas", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
            IconButton(
              icon: Icon(Icons.info_outline, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(context, '/info');
              },
            ),
            Text("Info", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
          ],
        ),
      ),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )
        ),
        backgroundColor: Color(0xff32425d),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Escolha um projeto", style: TextStyle(fontSize: 20),),
            ),
            MenuItemWidget("Levantamento Cadastral",'images/projetolevantamento.jpg', '/levantamento'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            MenuItemWidget("Projeto Arquitetônico",'images/projetoarquitetonico.png', '/arquitetonico'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            MenuItemWidget("Projeto Elétrico",'images/projetoeletrico.jpg', '/eletrico'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            MenuItemWidget("Projeto Hidrossanitário",'images/projetohidro.jpg','/hidro'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            MenuItemWidget("Pânico e Incêndio",'images/projetopanico.jpg','/panico'),
          ],
        ),
      ),
    );
  }
}

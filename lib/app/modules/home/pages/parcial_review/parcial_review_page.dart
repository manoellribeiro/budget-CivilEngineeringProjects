import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:precificacaodeprojetos/app/modules/home/components/firebaseAlertDialog/firebaseAlertDialog_widget.dart';
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/parcial_review/parcial_review_controller.dart';


class ParcialReviewPage extends StatefulWidget {
  final String title;
  const ParcialReviewPage({Key key, this.title = "Relatório Parcial"})
      : super(key: key);

  @override
  _ParcialReviewPageState createState() => _ParcialReviewPageState();
}


class _ParcialReviewPageState extends State<ParcialReviewPage> {


  final controller = ParcialReviewController();

  final budgetsBox = Hive.box('budgetsBox');
  _showDialog(){
    return showDialog(
        context: context,
        builder: (_){
          return FirebaseAlertDialogWidget();
        });
  }



  @override
  Widget build(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: WatchBoxBuilder(
        box: budgetsBox,
        builder: (context, box){
          return Visibility(
            visible: (!budgetsBox.isEmpty),
            child: FloatingActionButton.extended(
                backgroundColor: Color(0xff32425d),
                icon: Icon(Icons.save, color: Colors.white,),
                onPressed: (){
                  _showDialog();
                },
                label: Text("Salvar")),
          );
        },
      ),
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
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            Text("Página Principal", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
            IconButton(
              icon: Icon(Icons.assessment, color: Colors.white,),
              onPressed: (){
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
                Navigator.pushReplacementNamed(context,'/budgetView');
              },
            ),
            Text("Precificações Concluídas", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
            IconButton(
              icon: Icon(Icons.info_outline, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              budgetsBox.clear();
            },
          )
        ],
      ),
      body:  WatchBoxBuilder(box: budgetsBox, builder: (context, box){
        return ListView.builder(
            itemCount: budgetsBox.length,
            itemBuilder: (_, int index){
              BudgetModel budgetModel = BudgetModel.fromJson(budgetsBox.get(index));
              return Card(
                child: ListTile(
                  leading: Image.asset(budgetModel.imageLocation),
                  title: Text(budgetModel.name),
                  subtitle: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff32425d)
                        ),
                        height: screenWidht*0.08,
                        child: Center(child: Row(
                          children: <Widget>[
                            Icon(Icons.attach_money, color: Colors.white,),
                            Text("${budgetModel.estimateValue} - Preço Total", style: TextStyle(color: Colors.white),),
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                            )
                          ],
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.redAccent
                            ),
                            height: screenWidht*0.08,
                            child: Center(child: Row(
                              children: <Widget>[
                                Icon(Icons.directions_car, color: Colors.white,),
                                Text("${budgetModel.transportCosts}", style: TextStyle(color: Colors.white),),
                                Padding(
                                  padding: EdgeInsets.only(right: 5),
                                )
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.redAccent
                              ),
                              height: screenWidht*0.08,
                              child: Center(child: Row(
                                children: <Widget>[
                                  Icon(Icons.print, color: Colors.white,),
                                  Text("${budgetModel.plotingCosts}", style: TextStyle(color: Colors.white),),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                  )
                                ],
                              )),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.redAccent
                            ),
                            height: screenWidht*0.08,
                            child: Center(child: Row(
                              children: <Widget>[
                                Icon(Icons.class_, color: Colors.white,),
                                Text("${budgetModel.othersCosts}", style: TextStyle(color: Colors.white),),
                                Padding(
                                  padding: EdgeInsets.only(right: 5),
                                )
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.redAccent
                              ),
                              height: screenWidht*0.08,
                              child: Center(child: Row(
                                children: <Widget>[
                                  Icon(Icons.business, color: Colors.white,),
                                  Text("${budgetModel.fixCosts}", style: TextStyle(color: Colors.white),),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                  )
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}

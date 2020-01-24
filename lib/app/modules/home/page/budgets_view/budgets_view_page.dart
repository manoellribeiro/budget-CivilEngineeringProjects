import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:precificacaodeprojetos/app/modules/home/models/budget_model.dart';
import 'package:precificacaodeprojetos/app/modules/home/page/budgets_view/budgets_view_controller.dart';

class BudgetsViewPage extends StatefulWidget {
  final String title;
  const BudgetsViewPage({Key key, this.title = "Precificações Concluídas"})
      : super(key: key);

  @override
  _BudgetsViewPageState createState() => _BudgetsViewPageState();
}

class _BudgetsViewPageState extends State<BudgetsViewPage> {


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
            )
        ),
        backgroundColor: Color(0xff32425d),
        title: Text(widget.title),
        centerTitle: true,
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
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/parcialReview');
              },
            ),
            Text("Relatório Parcial", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
            IconButton(
              icon: Icon(Icons.playlist_add_check, color: Colors.white,),
              onPressed: (){
                print("Precificações Concluídas");
              },
            ),
            Text("Precificações Concluídas", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
            IconButton(
              icon: Icon(Icons.info_outline, color: Colors.white,),
              onPressed: (){
                print("Precificações Concluídas");
              },
            ),
            Text("Info", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("Precificações").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index){
                BudgetsViewController controller = BudgetsViewController();
                DocumentSnapshot docs = snapshot.data.documents[index];
                int howMuchProjecst = docs["howMuchProjects"];
                double geralEstimateValue = 0;
                double geralTransportCost = 0;
                double geralPlotingCost = 0;
                double geralOtherCost = 0;
                double geralFixCost = 0;
                List<BudgetModel> list =[];
                int k = 0;
                while (k < howMuchProjecst){
                  list.add(BudgetModel.fromJson(docs["Precificação $k"]));
                  geralEstimateValue += list[k].estimateValue;
                  geralTransportCost += list[k].transportCosts;
                  geralPlotingCost += list[k].plotingCosts;
                  geralOtherCost += list[k].othersCosts;
                  geralFixCost += list[k].fixCosts;
                  k++;
                }
                if(snapshot.hasData){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: screenWidht-10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Text("$geralEstimateValue", style: TextStyle(color: Colors.white),),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                  )
                                ],
                              )),
                            ),
                            Text("Cliente: ${docs["clientName"]}", style: TextStyle(color: Colors.black),),
                            IconButton(
                              icon: Icon(Icons.arrow_drop_down_circle),
                              onPressed: (){
                                controller.changeIsVisible();
                              },
                            ),
                          ],
                        ),
                        Observer(
                          builder: (_){
                            return Visibility(
                              visible: controller.isVisible,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: (screenHeight*0.4),
                                    child: ListView.builder(
                                        itemCount: list.length,
                                        itemBuilder: (BuildContext context, int index){
                                          return ListTile(
                                            leading: Container(
                                                padding: EdgeInsets.all(0),
                                                height: screenHeight*0.05,
                                                width: screenHeight*0.05,
                                                child: Image.asset(list[index].imageLocation)),
                                            title: Text("${list[index].name}: ${list[index].estimateValue} reais"),
                                          );
                                        }),
                                  ),
                                  Center(
                                    child: Text("Custos de Projeto"),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Color(0xff32425d)
                                        ),
                                        height: screenWidht*0.08,
                                        child: Center(child: Row(
                                          children: <Widget>[
                                            Icon(Icons.directions_car, color: Colors.white,),
                                            Text("$geralTransportCost", style: TextStyle(color: Colors.white),),
                                            Padding(
                                              padding: EdgeInsets.only(right: 5),
                                            )
                                          ],
                                        )),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Color(0xff32425d)
                                        ),
                                        height: screenWidht*0.07,
                                        child: Center(child: Row(
                                          children: <Widget>[
                                            Icon(Icons.print, color: Colors.white,),
                                            Text("$geralPlotingCost", style: TextStyle(color: Colors.white),),
                                            Padding(
                                              padding: EdgeInsets.only(right: 5),
                                            )
                                          ],
                                        )),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Color(0xff32425d)
                                        ),
                                        height: screenWidht*0.07,
                                        child: Center(child: Row(
                                          children: <Widget>[
                                            Icon(Icons.class_, color: Colors.white,),
                                            Text("$geralOtherCost", style: TextStyle(color: Colors.white),),
                                            Padding(
                                              padding: EdgeInsets.only(right: 5),
                                            )
                                          ],
                                        )),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            color: Color(0xff32425d)
                                        ),
                                        height: screenWidht*0.07,
                                        child: Center(child: Row(
                                          children: <Widget>[
                                            Icon(Icons.business, color: Colors.white,),
                                            Text("$geralFixCost", style: TextStyle(color: Colors.white),),
                                            Padding(
                                              padding: EdgeInsets.only(right: 5),
                                            )
                                          ],
                                        )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),

                      ],)
                    ),
                  );

                }else{
                  return Center(
                    child: Icon(Icons.refresh, size: 70),
                  );
                }
              }
          );
        },
      )
    );
  }
}





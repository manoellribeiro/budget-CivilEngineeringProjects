import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  final String title;
  const InfoPage({Key key, this.title = "Info"}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xff32425d),
            width: screenWidht,
            height: screenHeight/2,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xff42a44f),
              width: screenWidht,
              height: screenHeight/2,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: screenWidht*(0.9),
              height: screenHeight*(0.8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: screenHeight*0.4,
                    width: screenWidht*0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logobranco.jpeg"),
                            fit: BoxFit.contain
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("O aplicativo de Precificação de Projetos é uma ferramenta para membros da Engetec Engenharia Jr desenvolvida com finalidade de aprendizado sobre a licença de código aberto MIT.",
                    textAlign: TextAlign.justify,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: screenWidht*0.1,
                      backgroundImage: AssetImage('images/manoel.jpeg'),
                    ),
                  ),
                  Text("Desenvolvido por Manoel Ribeiro"),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Text("GitHub", style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),),
                          onTap: (){
                            launch('https://github.com/manoellribeiro');
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text("|"),
                        ),
                        GestureDetector(
                          child: Text("LinkedIn", style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),),
                          onTap: (){
                            launch('https://www.linkedin.com/in/manoel-ribeiro-06aa43134/');
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

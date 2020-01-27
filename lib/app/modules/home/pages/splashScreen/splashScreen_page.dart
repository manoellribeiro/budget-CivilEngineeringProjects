import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  final String title;
  const SplashScreenPage({Key key, this.title = "SplashScreen"})
      : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 4,
          backgroundColor: Color(0xff32425d),
          navigateAfterSeconds: HomePage(),
          loaderColor: Colors.transparent,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: screenHeight*0.4,
                width: screenWidht*0.6,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/logo.jpg"),
                        fit: BoxFit.contain
                    )
                ),
              ),
            ),
            Center(
              child: Container(
                height: screenHeight*0.15,
                width: screenWidht*0.2,
                child: FlareActor(
                  "images/loading.flr",
                  animation: "spin2",
                  fit: BoxFit.contain
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

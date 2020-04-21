import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final String imageLocation;
  final String routeName;

  const MenuItemWidget(this.title, this.imageLocation, this.routeName);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageLocation),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            width: screenWidth*0.5,
            height: screenHeight*0.2,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            )
        ],
      ),
    );
  }
}

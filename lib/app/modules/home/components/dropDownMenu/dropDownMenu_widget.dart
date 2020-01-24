import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DropDownMenuWidget extends StatelessWidget {

  String hintText;
  var itemsList = [""];
  void floorIndexMethod;

  DropDownMenuWidget(this.hintText, this.itemsList, this.floorIndexMethod());

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        hint: Text(hintText),
        icon: Icon(Icons.arrow_drop_down),
        items: itemsList.map((String dropDownStringItem){
          return DropdownMenuItem<String>(
            value: dropDownStringItem,
            child: Text(dropDownStringItem),
          );
        }).toList(),
        onChanged: (value) {
          print(value);
          hintText = value;
          floorIndexMethod;
        }
    );
  }
}

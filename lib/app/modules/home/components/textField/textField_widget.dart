import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final String errorFunction;
  final Function onChanged;
  final TextInputType keyboardType;
  const TextFieldWidget(this.text, this.errorFunction, this.onChanged, this.keyboardType);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
         contentPadding: EdgeInsets.symmetric(vertical: 0),
          errorText: errorFunction == null ? null : errorFunction,
          errorBorder:  OutlineInputBorder(
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
          labelText: text,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
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
          prefixIcon: Container(
            child: Icon(Icons.border_color, color: Colors.white),
            decoration: BoxDecoration(
                color: Color(0xff32425d),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
            ),
          ),),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0, color: Colors.black),
    );
  }
}

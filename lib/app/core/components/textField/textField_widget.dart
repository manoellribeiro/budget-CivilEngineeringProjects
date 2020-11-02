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
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          labelText: text,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          prefixIcon: Icon(Icons.border_color, color: Colors.grey),),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0, color: Colors.black),
    );
  }
}

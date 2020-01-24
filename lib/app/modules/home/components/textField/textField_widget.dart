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
          errorText: errorFunction == null ? null : errorFunction,
          labelText: text,
          labelStyle: TextStyle(color: Colors.black , fontSize: 25.0)),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0, color: Color(0xff42a44f)),
    );
  }
}

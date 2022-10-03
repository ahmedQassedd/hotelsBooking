import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  required String? Function(String?)? validator,
  String? label,
  String? hint,
  Function? suffixPressed,
  InputDecoration? border,
  bool secure = false ,
  IconData? prefix,
  IconData? suffix,

}) =>
    TextFormField(
      cursorColor: Colors.grey,
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      obscureText: secure,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
            onPressed: () {
              suffixPressed!();
            },
            icon: Icon(suffix , color: Colors.grey,)),
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );


//////
/////
////


Widget defaultTextFormFieldWithOnChange({
  required TextEditingController controller,
  required TextInputType inputType,
  required String? Function(String?)? validator,
  String? label,
  String? hint,
  InputDecoration? border,
  Function? suffixPressed,
  IconData? suffix,
  Function? change,




}) =>
    TextFormField(
      onChanged: (value){
        change!();
      },
      cursorColor: Colors.grey,
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
            onPressed: () {
              suffixPressed!();
            },
            icon: Icon(suffix , color: Colors.black54,)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

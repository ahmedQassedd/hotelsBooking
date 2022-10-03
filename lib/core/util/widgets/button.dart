import 'package:flutter/material.dart';

Widget customButton({
  double height = 50.0,
  double? width = double.infinity,
  Color? color = Colors.teal,
  required String text,


  required Function onPressed,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color ,
      ),
      child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          )),
    );
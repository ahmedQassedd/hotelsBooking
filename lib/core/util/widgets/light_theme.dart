import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightingTheme() => ThemeData(

  primarySwatch: Colors.teal,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.white),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),

    elevation: 0.0,

    titleTextStyle: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
    iconTheme: IconThemeData(color: Colors.black)
  ),
);
import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/choose_location.dart';

void main() =>  runApp(MaterialApp(
    initialRoute: '/',
    //routes is a map in java? = a dictionary in python?
    routes: {
      '/':(content) => Loading(),
      '/home':(content) => Home(),
      '/location':(content)=>ChooseLocation(),
    } ,
  ));


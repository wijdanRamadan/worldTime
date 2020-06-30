import 'package:flutter/material.dart';
import 'package:worldtime/UI/choose.dart';
import 'package:worldtime/UI/home.dart';
import 'package:worldtime/UI/loading.dart';



void main() => runApp(MaterialApp(

  initialRoute: '/loading',
  routes: {
     '/loading' : (context)=>Loading(),
    '/location' : (context)=> ChooseLocation(),
    '/home': (context)=>Home(),

  } ,

)
);


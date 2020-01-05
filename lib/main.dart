import 'package:flutter/material.dart';
import 'package:world/pages/home.dart';
import 'package:world/pages/loading.dart';
import 'package:world/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));



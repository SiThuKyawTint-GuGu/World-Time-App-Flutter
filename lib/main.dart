import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/location.dart';
void main()  => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => loading(),
    '/home' : (context) => home(),
    '/location' : (context) => location()
  },
));

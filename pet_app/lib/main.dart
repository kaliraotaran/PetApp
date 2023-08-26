import 'package:flutter/material.dart';
import 'package:pet_app/routes.dart';
import 'package:pet_app/starterpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: starterpage.routeName,
    routes: routes,
  ));
}

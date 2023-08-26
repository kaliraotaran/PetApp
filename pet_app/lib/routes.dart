// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pet_app/dog_profile.dart';
import 'package:pet_app/homepage.dart';
import 'package:pet_app/starterpage.dart';

final Map<String, WidgetBuilder> routes = {
  starterpage.routeName: (context) => starterpage(),
  Homepage.routeName: (context) => Homepage(),
  //DogProfile.routeName: (context) => DogProfile(

  //   )
};

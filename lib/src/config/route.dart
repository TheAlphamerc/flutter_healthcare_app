import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/home_page.dart';
import 'package:flutter_healthcare_app/src/pages/splash_page.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
          '/': (_) => SplashPage(),
          '/HomePage': (_) => HomePage(),
        };
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/doctor_view_model.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DoctorViewModel(),
      ),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Care',
      theme: AppTheme.lightTheme,
      routes: Routes.getRoute(),
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      debugShowCheckedModeBanner: false,
      initialRoute: "SplashPage",
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/model/appointment_model.dart';
import 'package:flutter_healthcare_app/src/viewModel/appointment_view_model.dart';
import 'package:flutter_healthcare_app/src/viewModel/auth_view_model.dart';
import 'package:flutter_healthcare_app/src/viewModel/doctor_view_model.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/viewModel/lab_test_view_model.dart';
import 'package:flutter_healthcare_app/src/viewModel/service_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DoctorViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => ServiceViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppointmentViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => LabTestViewModel(),
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


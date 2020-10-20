import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/appointment_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/pages/doctor/doctor_home_Page.dart';
import 'package:flutter_healthcare_app/src/pages/doctor/my_account_page.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/pages/medication_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class DoctorDashboardScreen extends StatefulWidget {
  @override
  _DoctorDashboardScreenState createState() => _DoctorDashboardScreenState();
}

class _DoctorDashboardScreenState extends State<DoctorDashboardScreen> {

  var currentPage = 0;
  final List<Widget> _children = [
    DoctorHomePage(),
    DoctorHomePage(),
    MedicationPage(),
    MyAccountPage(),
  ];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            size: 24,),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm,
            size: 24,),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,
            size: 24,),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box,
            size: 24,),
            title: Text(''),
          ),
        ],
        currentIndex: currentPage,
        selectedItemColor: ColorResources.themered,
        unselectedItemColor: ColorResources.lightblack.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        onTap: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}

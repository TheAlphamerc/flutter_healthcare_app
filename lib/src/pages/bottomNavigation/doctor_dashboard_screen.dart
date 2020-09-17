import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/appointment_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/pages/doctor/doctor_home_Page.dart';
import 'package:flutter_healthcare_app/src/pages/home_page.dart';
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
    DoctorHomePage(),
    DoctorHomePage(),
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
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center,
            size: 24,),
            title: Text('Service '),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range,
            size: 24,),
            title: Text('Appoinment'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description,
            size: 24,),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box,
            size: 24,),
            title: Text('Profile'),
          ),
        ],
        currentIndex: currentPage,
        selectedItemColor: LightColor.themered,
        unselectedItemColor: LightColor.lightblack.withOpacity(0.5),
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

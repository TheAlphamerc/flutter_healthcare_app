import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/user/appointment_page.dart';
import 'package:flutter_healthcare_app/src/pages/user/history_page.dart';
import 'package:flutter_healthcare_app/src/pages/user/home_Page.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  var currentPage = 0;
  final List<Widget> _children = [
    HomePage(),
    AppointmentPage(),
    HistoryPage(),
    HomePage(),
  ];

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

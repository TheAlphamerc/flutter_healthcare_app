import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/user/appointment_page.dart';
import 'package:flutter_healthcare_app/src/pages/user/history_page.dart';
import 'package:flutter_healthcare_app/src/pages/user/home_Page.dart';
import 'package:flutter_healthcare_app/src/pages/user/user_profile_menus.dart';
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
    //UserProfilePage(),
    UserProfileMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[currentPage],
        bottomNavigationBar: ConvexAppBar(
          activeColor: Colors.white,
          backgroundColor: ColorResources.themered,
          color: ColorResources.white,
          height: 50,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.date_range, title: 'Appointment'),
            TabItem(icon: Icons.description, title: 'History'),
            TabItem(icon: Icons.account_box, title: 'Profile'),
          ],
          initialActiveIndex: currentPage, //optional, default as 0
          onTap: (int position) {
            setState(() {
              currentPage = position;
            });
          },
        )
    );
  }
}

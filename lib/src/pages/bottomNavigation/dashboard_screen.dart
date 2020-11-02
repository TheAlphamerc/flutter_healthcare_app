import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/user/appointment_page.dart';
import 'package:flutter_healthcare_app/src/pages/user/history_page.dart';
import 'package:flutter_healthcare_app/src/pages/user/home_Page.dart';
import 'package:flutter_healthcare_app/src/pages/user/user_profile_menus.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  ShapeBorder bottomBarShape = RoundedRectangleBorder(
 //   borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;

  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = ColorResources.themered;
  Gradient selectedGradient = LinearGradient(colors: [ColorResources.themered, Colors.amber]);

  Color unselectedColor = Colors.blueGrey;
  Gradient unselectedGradient = LinearGradient(colors: [ColorResources.themered, Colors.blueGrey]);

  Color containerColor;
  List<Color> containerColors = [
    Color(0xFFFDE1D7),
    Color(0xFFE4EDF5),
    Color(0xFFF4E4CE),
    Color(0xFFE7EEED),
  ];




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
      bottomNavigationBar: SnakeNavigationBar.color(
      behaviour: snakeBarStyle,
      snakeShape: snakeShape,
      shape: bottomBarShape,
      ///configuration for SnakeNavigationBar.color
      snakeViewColor: selectedColor,
      selectedItemColor: snakeShape == SnakeShape.indicator ? selectedColor : null,
      unselectedItemColor: Colors.blueGrey,
      showUnselectedLabels: showUnselectedLabels,
      showSelectedLabels: showSelectedLabels,

      currentIndex: currentPage,
      onTap: (index) => setState(() => currentPage = index),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.date_range), label: 'Appointment'),
        BottomNavigationBarItem(icon: Icon(Icons.description), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Profile'),
      ],
    ),

    );
  }
}

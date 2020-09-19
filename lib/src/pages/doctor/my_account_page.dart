import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  var selected = 'Speciality';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: LightColor.lightblack,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_backspace,
              color: LightColor.white,
            ),
          ),
          title: Text(
            'My Account',
            style: TextStyle(color: LightColor.white),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 12, bottom: 12),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: LightColor.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    boxShadow: [
                      BoxShadow(
                        color: LightColor.lightblack.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.notifications_none,
                      color: LightColor.themered,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add),
            backgroundColor: LightColor.themered,
            onPressed: () {}),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                color: LightColor.lightblack,
              ),
              Positioned(
                  top: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      doctorInfo(context),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 10),
                          child: Text(
                            'press + to add new speciality',
                            style: TextStyle(
                                fontSize: 14,
                                color: LightColor.lightblack.withOpacity(0.5)),
                          ),
                        ),
                      )
                    ],
                  )),
              Positioned(
                top: 20,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      child: Image.asset(
                        'assets/user.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget doctorInfo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: LightColor.themered,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.edit,
                color: LightColor.white,
                size: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              'Dr. Endru keep',
              style: TextStyle(color: LightColor.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '+190-9898989898',
              style: TextStyle(color: LightColor.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              'e.keep@domain.com',
              style: TextStyle(color: LightColor.white, fontSize: 16),
            ),
          ),
          speciality(context),
        ],
      ),
    );
  }

  speciality(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: LightColor.lightblack,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // do what you need to do when "Click here" gets clicked
                setState(() {
                  selected = 'Speciality';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Speciality",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: selected == 'Speciality'
                          ? Colors.redAccent
                          : Colors.white,
                      fontSize: 14,
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                // do what you need to do when "Click here" gets clicked
                setState(() {
                  selected = 'Education';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Education',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selected == 'Education'
                            ? Colors.redAccent
                            : Colors.white,
                        fontSize: 14)),
              ),
            ),
            GestureDetector(
              onTap: () {
                // do what you need to do when "Click here" gets clicked
                setState(() {
                  selected = 'Location';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Location',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selected == 'Location'
                            ? Colors.redAccent
                            : Colors.white,
                        fontSize: 14)),
              ),
            ),
            GestureDetector(
              onTap: () {
                // do what you need to do when "Click here" gets clicked
                setState(() {
                  selected = 'Availibilty';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Availibilty',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selected == 'Availibilty'
                            ? Colors.redAccent
                            : Colors.white,
                        fontSize: 14)),
              ),
            ),
            GestureDetector(
              onTap: () {
                // do what you need to do when "Click here" gets clicked
                setState(() {
                  selected = 'V.Consultancy';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('V.Consultancy',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selected == 'V.Consultancy'
                            ? Colors.redAccent
                            : Colors.white,
                        fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

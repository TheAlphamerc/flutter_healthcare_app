import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: LightColor.themered,
              child: Center(
                child: Text(
                  'Appointment',
                  style: TextStyle(color: LightColor.white, fontSize: 18),
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: body(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/icon-sad.png',
            width: 40,
            height: 40,),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:10.0),
            child: Text('No appointment found',
            style: TextStyle(color: LightColor.lightblack.withOpacity(0.7),
            fontSize: 18),),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DoctorConsultantPage()));
            },
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.add,
                  color: LightColor.themered,
                      size: 40,),
                  Text('Appointment',
                  style: TextStyle(
                    fontSize: 18,
                    color: LightColor.themered
                  ),)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

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
              color: ColorResources.themered,
              child: Center(
                child: Text(
                  'Appointment',
                  style: TextStyle(color: ColorResources.white, fontSize: 18),
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
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context,index){
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
          decoration: BoxDecoration(
            color: ColorResources.skyBlue.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: ColorResources.lightBlue.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,top: 10,bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('24/12/2020',
                          style: TextStyle(
                            color: ColorResources.lightblack,
                            fontSize: 14
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(top:2.0),
                            child: Text('Dr. kamruzzaman',
                              style: TextStyle(
                                  color: ColorResources.black,
                                  fontSize: 16
                              ),),
                          ),
                          Text('Skin specialist',
                            style: TextStyle(
                                color: ColorResources.black,
                                fontSize: 12
                            ),),
                          Padding(
                            padding: const EdgeInsets.only(top:4.0),
                            child: Text('problem is hand skin',
                              style: TextStyle(
                                  color: ColorResources.lightblack,
                                  fontSize: 14
                              ),),
                          ),


                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.alarm,
                          color: ColorResources.lightblack,),
                          Text('23/08/20',
                          style: TextStyle(
                            color: ColorResources.lightblack,
                            fontSize: 14
                          ),),
                          Text('9 AM - 12 PM',
                            style: TextStyle(
                                color: ColorResources.lightblack,
                                fontSize: 14
                            ),),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 4,
                  right: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.skyBlue,
                      borderRadius: BorderRadius.only( topRight:Radius.circular(10),bottomLeft: Radius.circular(10))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text('Upcoming',
                        style: TextStyle(
                          color: ColorResources.white,
                          fontSize: 16
                        ),),
                      ),
                    ),
                  ))
            ],
          ),
        );
      })
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/appointment_model.dart';
import 'package:flutter_healthcare_app/src/model/patient_appointment.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class PatientDetailsPage extends StatefulWidget {
  PatientAppointment appointment;

  PatientDetailsPage( this.appointment);

  @override
  _PatientDetailsPageState createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_backspace,
            color: ColorResources.lightblack,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 12, bottom: 12),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: ColorResources.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.lightblack.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_none,
                    color: ColorResources.themered,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(context),
          patientInfo(context),
          reasonToVisit(context),
          button(context)
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15.0,right: 15,top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Patient details',
            style: TextStyle(fontSize: 20, color: ColorResources.lightblack),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Next',
                style: TextStyle(fontSize: 14, color: ColorResources.themered),
              ),
              Icon(Icons.arrow_forward,
                size: 15,
                color: ColorResources.themered,)
            ],
          )

        ],
      ),
    );
  }

  Widget patientInfo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ColorResources.lightblack.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.appointment.id,
                style: TextStyle(
                  color: ColorResources.themered,
                  fontSize: 12
                ),),
                Text('Last visit 12 july,2020',
                  style: TextStyle(
                      color: ColorResources.lightblack,
                      fontSize: 10
                  ),)
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right:15.0,top: 4),
              child: Text('Old',
              style: TextStyle(
                color: ColorResources.themered
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Text(widget.appointment.patientName,
            style: TextStyle(
              color: ColorResources.lightblack,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Text('${widget.appointment.gender}, ${widget.appointment.age} years',
              style: TextStyle(
                  color: ColorResources.lightblack,
                  fontSize: 12,

              ),),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right:15.0,bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: ColorResources.white,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorResources.lightblack.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.attach_file,
                        color: ColorResources.themered,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: ColorResources.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        boxShadow: [
                          BoxShadow(
                            color: ColorResources.lightblack.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text('RX',
                        style: TextStyle(
                          color: ColorResources.themered,
                          fontSize: 16
                        ),)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: ColorResources.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        boxShadow: [
                          BoxShadow(
                            color: ColorResources.lightblack.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.alarm,
                          color: ColorResources.themered,
                          size: 20,
                        ),
                      ),
                    ),
                  ),

              ],),
            ),
          )
        ],
      ),
    );
  }

  Widget reasonToVisit(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left:15.0,right: 15,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Reason to visit',style: TextStyle(
          color: ColorResources.lightblack.withOpacity(0.5),
          fontSize: 18
        ),),

        Padding(
          padding: const EdgeInsets.only(top:5.0,bottom: 10),
          child: Text(widget.appointment.reasons,style: TextStyle(
              color: ColorResources.lightblack.withOpacity(0.5),
              fontSize: 14
          ),),
        ),
          Text('Note',style: TextStyle(
              color: ColorResources.lightblack.withOpacity(0.5),
              fontSize: 18
          ),),

          Padding(
            padding: const EdgeInsets.only(top:5.0,bottom: 10),
            child: Text(widget.appointment.reasons,style: TextStyle(
                color: ColorResources.lightblack.withOpacity(0.5),
                fontSize: 14
            ),),
          )

      ],),
    );
  }

  Widget button(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: ColorResources.themered,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Start assesment',
                style: TextStyle(
                  color: ColorResources.white,
                  fontSize: 14
                ),),
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Cancel',
            style: TextStyle(
              color: ColorResources.themered,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
    );
  }
}

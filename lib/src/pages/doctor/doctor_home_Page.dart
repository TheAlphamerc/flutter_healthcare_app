import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/appointment_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/pages/doctor/all_patient_details.dart';
import 'package:flutter_healthcare_app/src/pages/doctor/patient_details_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  var selected = 'Upcoming';
  List<Appointment> appointmentDataList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appointmentDataList =
        appointmentList.map((x) => Appointment.fromJson(x)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: LightColor.lightblack,
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                headerText(context),
                categoryAndFilter(context),
                appointMentStaus(context),
              ],
            ),
          ),
          getAppointmentList(context)
        ],
      ),
    );
  }

  Widget headerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: TextStyle(fontSize: 20, color: LightColor.grey),
          ),
          Text(
            'Dr. Kuneil keep',
            style: TextStyle(
              fontSize: 20,
              color: LightColor.black,
            ),
          )
        ],
      ),
    );
  }

  Widget categoryAndFilter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: LightColor.lightblack.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 20.0,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selected = 'Upcoming';
                  });
                },
                child: Text("Upcoming",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: selected == 'Upcoming'
                          ? Colors.redAccent
                          : Colors.black54,
                      fontSize: 14,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selected = 'Re-schedule';
                  });
                },
                child: Text('Re-schedule',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selected == 'Re-schedule'
                            ? Colors.redAccent
                            : Colors.black54,
                        fontSize: 14)),
              ),
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selected = 'Canceld';
                  });
                },
                child: Text('Canceld',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selected == 'Canceld'
                            ? Colors.redAccent
                            : Colors.black54,
                        fontSize: 14)),
              ),
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selected = 'Completed';
                  });
                },
                child: Text('Completed',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selected == 'Completed'
                            ? Colors.redAccent
                            : Colors.black54,
                        fontSize: 14)),
              ),
              searchField(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget searchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(13)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: LightColor.lightblack.withOpacity(.3),
              blurRadius: 15,
              offset: Offset(5, 5),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 130,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "Search by appointment id",
                  hintStyle: TextStyle(color: LightColor.grey),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                      onTap: () {},
                      child:
                          Icon(Icons.filter_list, color: LightColor.themered)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search, color: LightColor.themered),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget appointMentStaus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:16.0,bottom:5),
          child: Text(
            'Today\'s appointment',
            style: TextStyle(color: LightColor.lightblack, fontSize: 18),
          ),
        ),
        Container(
          height: 3,
          width: MediaQuery.of(context).size.width,
          color: LightColor.lightblack.withOpacity(0.1),
        )
      ],
    );
  }

  Widget getAppointmentList(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ALlPatientDetails(appointmentDataList,index)));

          },
          child: Container(
            decoration: BoxDecoration(
              color: LightColor.white,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text('Today',
                                style: TextStyle(
                                  color: LightColor.grey,
                                  fontSize: 14,
                                ),),
                              Padding(
                                padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
                                child: Text(appointmentDataList[index].date,
                                  style: TextStyle(
                                      color: LightColor.themered,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                              Text(appointmentDataList[index].time,
                                style: TextStyle(
                                  color: LightColor.black,
                                  fontSize: 12,
                                ),)
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 60,
                          color: LightColor.lightblack.withOpacity(0.2),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(appointmentDataList[index].name,
                                  style: TextStyle(
                                    color: LightColor.black,
                                    fontSize: 18,
                                  ),),
                                Text('#${appointmentDataList[index].appointmentId}',
                                  style: TextStyle(
                                    color: LightColor.themered,
                                    fontSize: 14,
                                  ),),
                                Text('${appointmentDataList[index].gender}. ${appointmentDataList[index].age} years',
                                  style: TextStyle(
                                    color: LightColor.grey,
                                    fontSize: 14,
                                  ),),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:10.0),
                                  child: Text('Reason to get appointed',
                                    style: TextStyle(
                                      color: LightColor.black,
                                      fontSize: 14,
                                    ),),
                                ),

                              ],),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width,
                      color: LightColor.lightblack.withOpacity(0.1),
                    ),

                  ],
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Text('New',style: TextStyle(
                      color:LightColor.themered,
                      fontSize: 14
                  ),),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:10.0,),
                    child: Row(
                      children: [
                        Text('CANCEL',
                          style: TextStyle(
                              color: LightColor.themered,
                              fontSize: 12
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('RE-SCHEDULE',
                            style: TextStyle(
                                color: LightColor.lightblack,
                                fontSize: 12
                            ),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      childCount: appointmentDataList.length,
    ));
  }

}

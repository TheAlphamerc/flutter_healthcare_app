import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/appointment_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/model/patient_appointment.dart';
import 'package:flutter_healthcare_app/src/pages/doctor/all_patient_details.dart';
import 'package:intl/intl.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/patient_appointment_View_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {

  PatientAppointmentViewModel patientAppointmentViewModel;


  var selected = 'Upcoming';
  var isFirst = true;
  var isLoading = true;
  var isNotFound = false;
  var id;
  var userType;
  var firstName ='';
  var lastName ='';

  List<PatientAppointment> patientAppointmentList = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerInfo(context);

  }

  @override
  Widget build(BuildContext context) {
    patientAppointmentViewModel = Provider.of<PatientAppointmentViewModel>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: ColorResources.lightblack,
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
          patientAppointmentList != null? getAppointmentList(context):Container()
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
            style: TextStyle(fontSize: 20, color: ColorResources.grey),
          ),
          Text(
            '${firstName != null ? firstName:''}${lastName != null ? lastName:''}',
            style: TextStyle(
              fontSize: 20,
              color: ColorResources.black,
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
        color: ColorResources.lightblack.withOpacity(0.1),
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
                          ? ColorResources.themered
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
                            ? ColorResources.themered
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
                            ? ColorResources.themered
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
                            ? ColorResources.themered
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
              color: ColorResources.lightblack.withOpacity(.3),
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
                  hintStyle: TextStyle(color: ColorResources.grey),
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
                          Icon(Icons.filter_list, color: ColorResources.themered)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search, color: ColorResources.themered),
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
            style: TextStyle(color: ColorResources.lightblack, fontSize: 18),
          ),
        ),
        Container(
          height: 3,
          width: MediaQuery.of(context).size.width,
          color: ColorResources.lightblack.withOpacity(0.1),
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
                context, MaterialPageRoute(builder: (_) => ALlPatientDetails(patientAppointmentList,index)));

          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorResources.white,
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
                              Padding(
                                padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
                                child: Text('${DateFormat('dd MMM yyyy').format(DateFormat("dd/MM/yyyy").parse(patientAppointmentList[index].dates))}' ,
                                  style: TextStyle(
                                      color: ColorResources.themered,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                              Text(patientAppointmentList[index].appointmentTime,
                                style: TextStyle(
                                  color: ColorResources.black,
                                  fontSize: 12,
                                ),)
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 60,
                          color: ColorResources.lightblack.withOpacity(0.2),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(patientAppointmentList[index].patientName,
                                  style: TextStyle(
                                    color: ColorResources.black,
                                    fontSize: 18,
                                  ),),
                                Text('#${patientAppointmentList[index].id}',
                                  style: TextStyle(
                                    color: ColorResources.themered,
                                    fontSize: 14,
                                  ),),
                                Text('${patientAppointmentList[index].gender}. ${patientAppointmentList[index].age} years',
                                  style: TextStyle(
                                    color: ColorResources.grey,
                                    fontSize: 14,
                                  ),),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:10.0),
                                  child: Text('${patientAppointmentList[index].reasons != null ?patientAppointmentList[index].reasons:''}',
                                    style: TextStyle(
                                      color: ColorResources.black,
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
                      color: ColorResources.lightblack.withOpacity(0.1),
                    ),

                  ],
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Text('New',style: TextStyle(
                      color:ColorResources.themered,
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
                              color: ColorResources.themered,
                              fontSize: 12
                          ),),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('RE-SCHEDULE',
                            style: TextStyle(
                                color: ColorResources.lightblack,
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
      childCount: patientAppointmentList.length,
    ));
  }

  Widget loading(BuildContext context) {
    return isLoading
        ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: ColorResources.white.withOpacity(0.3),
        child: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorResources.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.lightBlue.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    'assets/loading.gif',
                    height: 300,
                    width: 300,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )
        : Text('');
  }

  Widget notFound(BuildContext context) {
    return isNotFound
        ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: ColorResources.white.withOpacity(0.3),
        child: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorResources.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.lightBlue.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    'assets/no_item.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )
        : Text('');
  }

  void getCustomerInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    id = customerInfo.getString('id');
    userType = customerInfo.getString('userType');
    firstName = customerInfo.getString('firstName');
    lastName = customerInfo.getString('lastName');

    if (id != null) {
      getAllPatientAppointment(context);
    }
  }

  void getAllPatientAppointment(BuildContext context) async{

      List<PatientAppointment> viewAppointment =
      await patientAppointmentViewModel.getAllPatientAppointment(id.toString());

      if (viewAppointment != null) {
        appointmentList.clear();
        if (viewAppointment.length > 0) {
          setState(() {
            viewAppointment.forEach((element) {
              patientAppointmentList.add(element);
            });
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
            isNotFound = true;
          });
        }
      }

  }

}

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/view_appointment.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/appointment_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  AppointmentViewModel appointmentViewModel;
  var isFirst = true;
  var id;
  var isLoading = true;
  var isNotFound = false;
  List<ViewAppointment> appointmentList = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerInfo(context);
  }
  @override
  Widget build(BuildContext context) {
    appointmentViewModel = Provider.of<AppointmentViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.themered,
        leading: Text(''),
        title: Text('Appointment',
        style: TextStyle(
          color: ColorResources.white,
          fontSize: 18
        ),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-55,
        child: Stack(
          children: [
            body(context),
            loading(context),
            notFound(context)

          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-55,
      child: Padding(
        padding: const EdgeInsets.only(top:15.0),
        child: ListView.builder(
            itemCount: appointmentList != null ? appointmentList.length:0,
            itemBuilder: (context,index){
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
            decoration: BoxDecoration(
              color: ColorResources.themered.withOpacity(0.5),
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
                            Text('${appointmentList[index].dates != null ? appointmentList[index].dates:'Not found'}',
                            style: TextStyle(
                              color: ColorResources.lightblack,
                              fontSize: 14
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(top:2.0),
                              child: Text('${appointmentList[index].doctorName != null ? appointmentList[index].doctorName:'Not found'}',
                                style: TextStyle(
                                    color: ColorResources.black,
                                    fontSize: 16
                                ),),
                            ),
                            Text('${appointmentList[index].doctorDept != null ? appointmentList[index].doctorDept:'Not found'}',
                              style: TextStyle(
                                  color: ColorResources.black,
                                  fontSize: 12
                              ),),
                            Padding(
                              padding: const EdgeInsets.only(top:4.0),
                              child: Text('${appointmentList[index].reasons != null ? appointmentList[index].reasons:'Not found'}',
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
                            Text('${appointmentList[index].dates != null ? appointmentList[index].dates:'Not found'}',
                            style: TextStyle(
                              color: ColorResources.lightblack,
                              fontSize: 14
                            ),),
                            Text('${appointmentList[index].timeid != null ? appointmentList[index].timeid:'Not found'}',
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
                        color: ColorResources.themered,
                        borderRadius: BorderRadius.only( topRight:Radius.circular(10),bottomLeft: Radius.circular(10))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text('${appointmentList[index].status != null ? appointmentList[index].status:'Not found'}',
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
        }),
      )
    );
  }
  void getCustomerInfo(BuildContext context) async{
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    id = customerInfo.getString('id');
    if(id != null){
      getAllAppointment(context);
    }
  }

  void getAllAppointment(BuildContext context) async{
    print(id);
    List<ViewAppointment> viewAppointment = await appointmentViewModel.getAllAppointment(id);

    if(viewAppointment != null){

      if(viewAppointment.length > 0) {
        setState(() {
          viewAppointment.forEach((element) {
            appointmentList.add(element);

          });
          isLoading = false;
        });
      }else{
        setState(() {
          isLoading = false;
          isNotFound = true;
        });

      }
    }

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
}

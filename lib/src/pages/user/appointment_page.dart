import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/model/view_appointment.dart';
import 'package:flutter_healthcare_app/src/pages/book_appoint_page.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/viewModel/appointment_view_model.dart';
import 'package:flutter_healthcare_app/src/viewModel/doctor_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentPage extends StatefulWidget {
  String appointmentId;
  String timeId;
  String appointmentDate;
  String reason;
  String paymenthod;

  AppointmentPage(
      {this.appointmentId,
      this.timeId,
      this.appointmentDate,
      this.reason,
      this.paymenthod});

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppointmentViewModel appointmentViewModel;
  DoctorViewModel doctorViewModel;
  var isFirst = true;
  var id;
  var userType;
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
    doctorViewModel = Provider.of<DoctorViewModel>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorResources.themered,
        leading: Text(''),
        title: Text(
          'Appointment',
          style: TextStyle(color: ColorResources.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 55,
        child: Stack(
          children: [body(context), loading(context), notFound(context)],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 55,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ListView.builder(
              itemCount: appointmentList != null ? appointmentList.length : 0,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  decoration: BoxDecoration(
                      color: ColorResources.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorResources.lightBlue.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ]),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${appointmentList[index].dates != null ? appointmentList[index].dates : 'Not found'}',
                                    style: TextStyle(
                                        color: ColorResources.lightblack,
                                        fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      '${appointmentList[index].doctorName != null ? appointmentList[index].doctorName : 'Not found'}',
                                      style: TextStyle(
                                          color: ColorResources.black,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    '${appointmentList[index].doctorDept != null ? appointmentList[index].doctorDept : 'Not found'}',
                                    style: TextStyle(
                                        color: ColorResources.black,
                                        fontSize: 12),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      '${appointmentList[index].reasons != null ? appointmentList[index].reasons : 'Not found'}',
                                      style: TextStyle(
                                          color: ColorResources.lightblack,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.alarm,
                                    color: ColorResources.themered,
                                  ),
                                  Text(
                                    '${appointmentList[index].dates != null ? appointmentList[index].dates : 'Not found'}',
                                    style: TextStyle(
                                        color: ColorResources.themered,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    '${appointmentList[index].appointmentTime != null ? appointmentList[index].appointmentTime : 'Not found'}',
                                    style: TextStyle(
                                        color: ColorResources.themered,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          top: 4,
                          left: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                color: definceColor(
                                    '${appointmentList[index].status != null ? appointmentList[index].status : 'Not found'}'),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text(
                                  '${appointmentList[index].status != null ? appointmentList[index].status : 'Not found'}',
                                  style: TextStyle(
                                      color: ColorResources.white,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          )),
                      Positioned(
                          top: 4,
                          right: 4,
                          child: appointmentList[index].status != null &&
                                  appointmentList[index].status == 'Upcoming'
                              ? Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => openModificationDialog(
                                          context,
                                          appointmentList[index].id,
                                          appointmentList[index].doctorid,
                                          appointmentList[index].doctorName,
                                          appointmentList[index].speciality,
                                          appointmentList[index].timeid,
                                          appointmentList[index].dates,
                                          appointmentList[index].reasons,
                                          appointmentList[index].paymethod),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            border: Border.all(
                                                color: ColorResources.grey)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Center(
                                            child: Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: ColorResources.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: GestureDetector(
                                        onTap: () => openConfirmationDialog(
                                            context, appointmentList[index].id),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              border: Border.all(
                                                  color: ColorResources.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Center(
                                              child: Icon(
                                                Icons.clear,
                                                size: 20,
                                                color: ColorResources.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(''))
                    ],
                  ),
                );
              }),
        ));
  }

  void getCustomerInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    id = customerInfo.getString('id');
    userType = customerInfo.getString('userType');

    if (id != null) {
      getAllAppointment(context);
    }
  }

  void getAllAppointment(BuildContext context) async {
    print(id);
    List<ViewAppointment> viewAppointment =
        await appointmentViewModel.getAllAppointment(id, userType);

    if (viewAppointment != null) {
      appointmentList.clear();
      if (viewAppointment.length > 0) {
        setState(() {
          viewAppointment.forEach((element) {
            appointmentList.add(element);
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

  Color definceColor(String status) {
    Color color;
    if (status == 'Upcoming') {
      color = ColorResources.skyBlue;
    } else if (status == 'Cancelled') {
      color = ColorResources.lightOrange;
    } else if (status == 'Completed') {
      color = ColorResources.themered;
    } else {
      color = ColorResources.white;
    }
    return color;
  }

  void openConfirmationDialog(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Do you want to cancel the appointment?',
                          style: TextStyle(
                            color: ColorResources.lightblack,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: ColorResources.themered,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                          color: ColorResources.lightOrange),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => cancelAppointment(context, id),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: ColorResources.themered),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void openModificationDialog(
      BuildContext context,
      String id,
      String doctorid,
      String doctorName,
      String speciality,
      timeid,
      String dates,
      String reasons,
      paymethod) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Do you want to edit the appointment?',
                          style: TextStyle(
                            color: ColorResources.lightblack,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: ColorResources.themered,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                          color: ColorResources.lightOrange),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => modificationAppointment(
                                    context,
                                    id,
                                    doctorName,
                                    doctorid,
                                    speciality,
                                    timeid,
                                    dates,
                                    reasons,
                                    paymethod),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: ColorResources.themered),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void cancelAppointment(BuildContext context, String id) async {
    Navigator.pop(context);
    setState(() {
      isLoading = true;
    });

    RegistrationResponse response =
        await appointmentViewModel.cancelAppointment(id);

    if (response != null) {
      getAllAppointment(context);
    }
  }

  void modificationAppointment(
      BuildContext context,
      String id,
      String doctorName,
      String doctorid,
      String speciality,
      timeid,
      String dates,
      String reasons,
      paymethod) async {
    List<Available> availables =
        await doctorViewModel.getAvailibility(doctorid);

    if (availables != null) {
      Doctor doctor =
          new Doctor(id: doctorid, name: doctorName, specialist: speciality);

      print(timeid);
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => BookAppointmentPage(
                    doctor,
                    availables,
                    appointmentId: id,
                    timeId: timeid,
                    appointmentDate: dates,
                    reason: reasons,
                    paymenthod: paymethod,
                  )));
    }
  }
}

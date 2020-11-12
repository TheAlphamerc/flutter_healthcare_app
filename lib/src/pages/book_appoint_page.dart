import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_healthcare_app/src/model/appointment.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/appointment_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookAppointmentPage extends StatefulWidget {
  Doctor doctor;
  List<Available> availableList;
  String appointmentId;
  String timeId;
  String appointmentDate;
  String reason;
  String paymenthod;

  BookAppointmentPage(this.doctor, this.availableList,{this.appointmentId, this.timeId, this.appointmentDate,
    this.reason, this.paymenthod});

  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  TextEditingController _problemController = TextEditingController();
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  AppointmentViewModel appointmentViewModel;
  var cashpayment = false;
  var selectDay = 'Day';
  var showDate = 'Select appointment date';
  var time = 'Schdule';
  var timeId;
  var isFirst = true;
  var isLoading = false;
  List<String> availableDays = new List();
  List<String> availableTimes = new List();
  Map<String, Object> availableTimesMap = HashMap<String, Object>();
  RegExp exp = RegExp(r"\r\n", multiLine: true, caseSensitive: true);
  var id;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerInfo(context);
    saveBasicData(context);
  }
  @override
  Widget build(BuildContext context) {
    appointmentViewModel = Provider.of<AppointmentViewModel>(context);
    if (isFirst) {
      creatDateList();
      if(widget.appointmentId != null){
        timeList(context, DateFormat('EEEE').format(DateFormat("dd/MM/yyyy").parse(widget.appointmentDate)));
      }
      setState(() {
        isFirst = false;
      });
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorResources.themered,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_backspace)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                headerpart(context),
                tellProblem(context),
                payment(context),
                bookAppointmentButton(context),
              ],
            ),
          ),
          loading(context)
        ],
      ),
    );
  }

  Widget headerpart(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ColorResources.themered,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, bottom: 10),
            child: Text(
              'Book your appointment',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Doctor',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: ColorResources.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.doctor.name}',
                            style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${widget.doctor.specialist.replaceAll(exp,', ')}',
                            style: TextStyle(
                              color: ColorResources.lightblack,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DoctorConsultantPage()));
                      },
                      child: Icon(
                        Icons.repeat,
                        color: ColorResources.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
            child: GestureDetector(
              onTap: (){
                openDayPicker(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('$showDate',
                        style: TextStyle(
                          fontSize: 16
                        ),),
                      ),
                      Icon(Icons.calendar_today_outlined,
                      color: ColorResources.lightblack,)

                    ],
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: ColorResources.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorResources.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('$selectDay',
                          style: TextStyle(
                            fontSize: 16
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: ColorResources.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorResources.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: DropdownButton(
                            hint: Text(
                              time != null ? time : '',
                              style: TextStyle(
                                  color: ColorResources.black, fontSize: 16),
                            ),
                            isExpanded: true,
                            iconSize: 30.0,
                            underline: Text(''),
                            style: TextStyle(
                                color: ColorResources.black, fontSize: 18),
                            items: availableTimesMap.keys.map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  time = val;
                                  timeId = availableTimesMap[time];

                                },
                              );
                            },
                          ),
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
    );
  }

  Widget tellProblem(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Tell your problem',
              style: TextStyle(
                color: ColorResources.lightblack,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: ColorResources.lightblack.withOpacity(0.5), width: 2)),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: ColorResources.black,
                controller: _problemController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget payment(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Payment',
              style: TextStyle(
                color: ColorResources.lightblack,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 4 - 25,
                right: MediaQuery.of(context).size.width / 4 - 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/paypal.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/visa.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/mastercard.png',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Divider(
              thickness: 1,
              color: ColorResources.lightblack.withOpacity(0.5),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: cashpayment,
                  activeColor: ColorResources.themered,
                  onChanged: (bool newValue) {
                    setState(() {
                      cashpayment = newValue;
                    });
                  }),
              Text(
                'Pay with money',
                style: TextStyle(
                  color: ColorResources.lightblack,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  bookAppointmentButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10.0, 10, 20),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(
            onPressed: () {

              checkValue(context);

            },
            color: ColorResources.themered,
            child: Text(
              widget.appointmentId == null ? 'Book appointment':'Update appointment',
              style: TextStyle(color: ColorResources.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  void openDayPicker(BuildContext context) {
    var isFound = false;
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        theme: DatePickerTheme(
            doneStyle: TextStyle(color: ColorResources.themered, fontSize: 16),
            cancelStyle: TextStyle(color: ColorResources.white, fontSize: 16)),
        minTime: DateTime.now(),
        maxTime: DateTime(2050, 12, 30),
        onChanged: (date) {}, onConfirm: (date) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(date);
          setState(() {
            availableDays.forEach((element) { 
              if(element.toLowerCase() == DateFormat('EEEE').format(date).toLowerCase()){
                showDate = formattedDate;
                selectDay = element;
                isFound = true;
                timeList(context, element);
              }
            });
            if(!isFound){
              showSnakbar(context, 'No schdule found');
              selectDay = 'Day';
              availableTimes.clear();
              time = 'Schdule';
              showDate = 'Select appointment date';
            }
            
          });
        }, currentTime: DateTime.now(), locale: LocaleType.en);
  }


  void timeList(BuildContext context, String val) {
    widget.availableList.forEach((element) {
      if (val == element.days) {
        availableTimes.clear();
        setState(() {
          time = element.timeList[0].times;
          timeId = element.timeList[0].id;
          element.timeList.forEach((time) {
            availableTimesMap['${time.times}'] = time.id;
            availableTimes.add(time.times);
          });
        });

       widget.availableList.forEach((element) {
          if(element.timeList[0].id == widget.timeId){
            setState(() {
              time = element.timeList[0].times;
            });
          }
        });


      }
    });
  }

  void creatDateList() {
    widget.availableList.forEach((element) {
      availableDays.add(element.days);
    });
  }

  void showSnakbar(BuildContext context, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: ColorResources.themered,
        content: new Text(
          message,
          style: TextStyle(color: ColorResources.white),
        )));
  }

  void checkValue(BuildContext context) {
    if(showDate == 'Select appointment date'){
      showSnakbar(context, 'Select appointment date');
    }else if(_problemController.text.isEmpty){
      showSnakbar(context, 'Tell your problem');
    }else if(!cashpayment){
      showSnakbar(context, 'Select payment method');
    }else{
      setState(() {
        isLoading = true;
      });
      Appointment appointment = new Appointment(id,widget.doctor.id,showDate,timeId,_problemController.text,
      'Money');

      sendAppointmentRequest(context,appointment);
    }
  }

  void sendAppointmentRequest(BuildContext context, Appointment appointment) async{

    RegistrationResponse response;

    if(widget.appointmentId != null){
      response = await appointmentViewModel.updateAppointment(appointment,widget.appointmentId);
    }else{
       response = await appointmentViewModel.saveAppointment(appointment);
    }


    if(response != null){
      setState(() {
        isLoading = false;
      });
      if(!response.success){
        showSnakbar(context, response.message);
      }else{
        showSnakbar(context, response.message);
      }
    }

  }

  void getCustomerInfo(BuildContext context) async{
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    setState(() {
      id = customerInfo.getString('id');
    });

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

  void saveBasicData(BuildContext context) {
    if(widget.appointmentId != null){
      setState(() {
        timeId = widget.timeId;
        showDate = widget.appointmentDate;
        _problemController.text = widget.reason;
        cashpayment = true;
        selectDay = DateFormat('EEEE').format(DateFormat("dd/MM/yyyy").parse(widget.appointmentDate));
      });
    }
  }
}

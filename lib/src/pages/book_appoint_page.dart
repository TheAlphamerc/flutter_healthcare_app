import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:intl/intl.dart';

class BookAppointmentPage extends StatefulWidget {
  Doctor doctor;
  List<Available> availableList;

  BookAppointmentPage(this.doctor, this.availableList);

  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  TextEditingController _problemController = TextEditingController();
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  var cashpayment = false;
  var selectDay = 'Day';
  var showDate = 'Select appointment date';
  var time = 'Schdule';
  var isFirst = true;
  List<String> availableDays = new List();
  List<String> availableTimes = new List();
  RegExp exp = RegExp(r"\r\n", multiLine: true, caseSensitive: true);

  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      creatDateList();
      setState(() {
        isFirst = false;
      });
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: LightColor.themered,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_backspace)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerpart(context),
            tellProblem(context),
            payment(context),
            bookAppointmentButton(context),
          ],
        ),
      ),
    );
  }

  Widget headerpart(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: LightColor.themered,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, bottom: 10),
            child: Text(
              'Book your appointment',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Doctor',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: LightColor.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: LightColor.black.withOpacity(0.2),
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
                              color: LightColor.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${widget.doctor.specialist.replaceAll(exp,', ')}',
                            style: TextStyle(
                              color: LightColor.lightblack,
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
                        color: LightColor.black,
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
                    color: LightColor.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: LightColor.black.withOpacity(0.2),
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
                      color: LightColor.lightblack,)

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
                          color: LightColor.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: LightColor.black.withOpacity(0.2),
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
                          color: LightColor.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: LightColor.black.withOpacity(0.2),
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
                                  color: LightColor.black, fontSize: 16),
                            ),
                            isExpanded: true,
                            iconSize: 30.0,
                            underline: Text(''),
                            style: TextStyle(
                                color: LightColor.black, fontSize: 18),
                            items: availableTimes.map(
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
                color: LightColor.lightblack,
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
                      color: LightColor.lightblack.withOpacity(0.5), width: 2)),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: LightColor.black,
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
                color: LightColor.lightblack,
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
              color: LightColor.lightblack.withOpacity(0.5),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: cashpayment,
                  activeColor: LightColor.themered,
                  onChanged: (bool newValue) {
                    setState(() {
                      cashpayment = newValue;
                    });
                  }),
              Text(
                'Pay with money',
                style: TextStyle(
                  color: LightColor.lightblack,
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
            onPressed: () {},
            color: LightColor.themered,
            child: Text(
              'Book appointment',
              style: TextStyle(color: LightColor.white, fontSize: 18),
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
            doneStyle: TextStyle(color: LightColor.themered, fontSize: 16),
            cancelStyle: TextStyle(color: LightColor.white, fontSize: 16)),
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
          element.timeList.forEach((time) {
            availableTimes.add(time.times);
          });
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
        backgroundColor: LightColor.themered,
        content: new Text(
          message,
          style: TextStyle(color: LightColor.white),
        )));
  }
}

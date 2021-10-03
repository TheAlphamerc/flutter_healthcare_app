import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_healthcare_app/src/model/lab_test_by_category.dart';
import 'package:flutter_healthcare_app/src/model/lab_test_category.dart';
import 'package:flutter_healthcare_app/src/pages/bottomNavigation/dashboard_screen.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/lab_test_view_model.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LabTestPage extends StatefulWidget {
  String labTestId;
  String testId;
  String testCatId;
  String testAmount;
  String sampleCollectDate;
  String sampleCollectTime;
  String paymentType;

  LabTestPage(
      {this.labTestId,
      this.testId,
      this.testCatId,
      this.testAmount,
      this.sampleCollectDate,
      this.sampleCollectTime,
      this.paymentType});

  @override
  _LabTestPageState createState() => _LabTestPageState();
}

class _LabTestPageState extends State<LabTestPage> {
  LabTestViewModel labTestViewModel;
  TextEditingController _problemController = TextEditingController();
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  var cashpayment = false;
  var selectDate = 'Satuday';
  var selectTestCategory;
  var isLoading = false;
  var selectTest;
  var labtestId;
  var amount;
  var testId;
  var id;
  List<LabTestCategory> labTestCategoryList = new List();
  List<LabTestByCategory> labTestByCategoryList = new List();

  var isFirst = true;
  Map<String, Object> labTestCategoryMap = HashMap<String, Object>();

  var time = '00.00';
  var day = 'dd/mm/yyyy';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerInfo(context);
    setModValue(context);
  }

  @override
  Widget build(BuildContext context) {
    labTestViewModel = Provider.of<LabTestViewModel>(context);
    if (isFirst) {
      getAllLabtest(context);

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
              'Lab test',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 30),
            child: Text(
              'Find your test from the below',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Test category',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
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
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: DropdownButton(
                    hint: Text(
                      selectTestCategory != null ? selectTestCategory : '',
                      style:
                          TextStyle(color: ColorResources.black, fontSize: 16),
                    ),
                    isExpanded: true,
                    iconSize: 30.0,
                    underline: Text(''),
                    style: TextStyle(color: ColorResources.black, fontSize: 18),
                    items: labTestCategoryMap.keys.map(
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
                          selectTestCategory = val;
                          labtestId = labTestCategoryMap['$val'];
                          getLabTestById(context, labtestId);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Choose Test',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
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
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: DropdownButton(
                        hint: Text(
                          selectTest != null ? selectTest : '',
                          style: TextStyle(
                              color: ColorResources.black, fontSize: 16),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        underline: Text(''),
                        style: TextStyle(
                            color: ColorResources.black, fontSize: 18),
                        items: labTestByCategoryList.map(
                          (LabTestByCategory val) {
                            return DropdownMenuItem<LabTestByCategory>(
                              value: val,
                              child: Text(val.testname),
                            );
                          },
                        ).toList(),
                        onChanged: (LabTestByCategory val) {
                          setState(
                            () {
                              selectTest = val.testname;
                              labtestId = val.id;
                              amount = val.testamount;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                      width: 1, height: 50, color: ColorResources.themered),
                  SizedBox(
                    width: 100,
                    child: Center(
                      child: Text(
                        '${amount != null ? '$amount /-' : ''}',
                        style: TextStyle(
                            color: ColorResources.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Choose your prefered time',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        openDayPicker(context);
                      },
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
                          padding: const EdgeInsets.only(left: 10.0, right: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '$day',
                                  style: TextStyle(
                                      color: ColorResources.black,
                                      fontSize: 14),
                                ),
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                color: ColorResources.themered,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        openTimePicker(context);
                      },
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
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '$time',
                                  style: TextStyle(
                                      color: ColorResources.black,
                                      fontSize: 14),
                                ),
                              ),
                              Icon(
                                Icons.alarm_sharp,
                                color: ColorResources.themered,
                              )
                            ],
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
              checkField(context);
            },
            color: ColorResources.themered,
            child: Text(
              widget.testId == null ? 'Add to cart' : 'Update labtest',
              style: TextStyle(color: ColorResources.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  void openTimePicker(BuildContext context) {
    DatePicker.showTime12hPicker(context, showTitleActions: true,
        onChanged: (date) {
      setState(() {
        time = DateFormat('hh:mm aa').format(date);
      });
    }, onConfirm: (date) {
      setState(() {
        time = DateFormat('hh:mm aa').format(date);
      });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  void openDayPicker(BuildContext context) {
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
        day = formattedDate;
      });
    },
        currentTime: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
        locale: LocaleType.en);
  }

  void getAllLabtest(BuildContext context) async {
    List<LabTestCategory> labtests = await labTestViewModel.getAllLabtest();

    if (labtests != null) {
      print(labtests.length);

      labtests.forEach((lab) {
        setState(() {
          labTestCategoryList.add(lab);
          labTestCategoryMap['${lab.cattestname}'] = lab.id;
        });
      });
      setState(() {
        selectTestCategory = labTestCategoryList[0].cattestname;
        labtestId = labTestCategoryList[0].id;
        getLabTestById(context, labtestId);
      });

      if (widget.testCatId != null) {
        labTestCategoryList.forEach((element) {
          if (element.id == widget.testCatId) {
            setState(() {
              selectTestCategory = element.cattestname;
            });
          }
        });
      }
    }
  }

  void getLabTestById(BuildContext context, String id) async {
    List<LabTestByCategory> labtestByCat =
        await labTestViewModel.getLabTestByCategory(id);

    if (labtestByCat != null) {
      labTestByCategoryList.clear();
      labtestByCat.forEach((lab) {
        setState(() {
          labTestByCategoryList.add(lab);
        });
      });
      setState(() {
        selectTest = labTestByCategoryList[0].testname;
        testId = labTestByCategoryList[0].id;
        amount = labTestByCategoryList[0].testamount;
      });
      if (widget.testId != null) {
        labTestByCategoryList.forEach((element) {
          if (element.id == widget.testId) {
            setState(() {
              selectTest = element.testname;
              amount = widget.testAmount;
            });
          }
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

  void showSnakbar(BuildContext context, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: ColorResources.themered,
        content: new Text(
          message,
          style: TextStyle(color: ColorResources.white),
        )));
  }

  void checkField(BuildContext context) {
    if (day == 'dd/mm/yyyy') {
      showSnakbar(context, 'Please select date');
    } else if (time == '00.00') {
      showSnakbar(context, 'please select time');
    } else if (!cashpayment) {
      showSnakbar(context, 'Select payment method');
    } else {
      setState(() {
        isLoading = true;
      });

        saveDataIntoDb(context);
    }
  }

  void getCustomerInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    setState(() {
      id = customerInfo.getString('id');
    });
  }

  void saveDataIntoDb(BuildContext context) async {

    RegistrationResponse response;

    if(widget.testId != null){
      response = await labTestViewModel.updateLabtest(widget.labTestId,
          testId, labtestId, id, amount, day, time, 'Cash');
    }else {
      response = await labTestViewModel.saveLabTest(
          testId,
          labtestId,
          id,
          amount,
          day,
          time,
          'Cash');
    }

    if (response != null) {
      setState(() {
        isLoading = false;
      });
      if (response.success) {
        setState(() {
          day = 'dd/mm/yyyy';
          time = '00.00';
        });
        showSnakbar(context, response.message);
      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardScreen()));
      } else {
        showSnakbar(context, response.message);
      }

    }
  }

  void setModValue(BuildContext context) {
    if (widget.testId != null) {
      setState(() {
        testId = widget.testId;
        labtestId = widget.testCatId;
        cashpayment = true;
        day = widget.sampleCollectDate;
        time = widget.sampleCollectTime;
        amount = widget.testAmount;
      });
    }
  }
}

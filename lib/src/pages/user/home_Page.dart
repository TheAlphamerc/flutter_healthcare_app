import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/all_service.dart';
import 'package:flutter_healthcare_app/src/pages/book_appoint_page.dart';
import 'package:flutter_healthcare_app/src/pages/doctor/doctor_home_Page.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/pages/eshop/eshop_home_page.dart';
import 'package:flutter_healthcare_app/src/pages/user/lab_test_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  'Welcome, Arafat',
                  style: TextStyle(color: ColorResources.white, fontSize: 18),
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: body(context),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 115,
              child: summary(context),
            )
          ],
        ),
      ),
    );
  }

  Widget summary(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorResources.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorResources.lightblack.withOpacity(.3),
              blurRadius: 15,
              offset: Offset(5, 5),
            )
          ]),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.lightblack.withOpacity(0.2),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(130))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.shopping_cart,
                          color: ColorResources.themered,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cart',
                          style: TextStyle(
                              color: ColorResources.lightblack, fontSize: 14),
                        ),
                        Text(
                          '\$ 00.00',
                          style: TextStyle(
                              color: ColorResources.lightblack, fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.lightblack.withOpacity(0.2),
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(130))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.date_range,
                          color: ColorResources.themered,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Appointments',
                          style: TextStyle(
                              color: ColorResources.lightblack, fontSize: 14),
                        ),
                        Text(
                          '9+',
                          style: TextStyle(
                              color: ColorResources.lightblack, fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      
          height: MediaQuery.of(context).size.height-200 ,


          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(

                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => DoctorConsultantPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: ColorResources.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: ColorResources.lightblack.withOpacity(.3),
                                    blurRadius: 15,
                                    offset: Offset(5, 5),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                  child: Image.asset(
                                    'assets/ic_doctor.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  'DOCTOR CONSULTAION',
                                  style:
                                      TextStyle(color: ColorResources.themered, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 5, right: 10, bottom: 10),
                                  child: Text(
                                    'Find  a doctor and get appoinment for health care professional for your condition',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorResources.lightblack.withOpacity(0.6),
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => EshopHomePage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: ColorResources.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: ColorResources.lightblack.withOpacity(.3),
                                    blurRadius: 15,
                                    offset: Offset(5, 5),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                  child: Image.asset(
                                    'assets/ic_marketplace.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  'MARKETPLACE',
                                  style:
                                      TextStyle(color: ColorResources.themered, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 5, right: 10, bottom: 10),
                                  child: Text(
                                    'Browse through our wide range of health products and services',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorResources.lightblack.withOpacity(0.6),
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LabTestPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: ColorResources.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: ColorResources.lightblack.withOpacity(.3),
                                    blurRadius: 15,
                                    offset: Offset(5, 5),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                  child: Image.asset(
                                    'assets/ic_labtest.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  'LAB TEST',
                                  style:
                                  TextStyle(color: ColorResources.themered, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 5, right: 10, bottom: 10),
                                  child: Text(
                                    'Browse through our wide range of lab test for checkup your healt condition',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorResources.lightblack.withOpacity(0.6),
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ServicePage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color: ColorResources.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: ColorResources.lightblack.withOpacity(.3),
                                    blurRadius: 15,
                                    offset: Offset(5, 5),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                  child: Image.asset(
                                    'assets/ic_service.png',
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  'SERVICES',
                                  style:
                                  TextStyle(color: ColorResources.themered, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 5, right: 10, bottom: 10),
                                  child: Text(
                                    'Browse through our wide range of services for quick response by the provider',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorResources.lightblack.withOpacity(0.6),
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
       

    );
  }
}

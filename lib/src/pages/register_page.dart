import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/viewModel/auth_view_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:provider/provider.dart';

import '../theme/light_color.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Position _currentPosition;
  AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
  }

  final firstNameValueHolder = TextEditingController();
  final lastNameValueHolder = TextEditingController();
  final passValueHolder = TextEditingController();
  final phoneValueHolder = TextEditingController();
  final emailValueHolder = TextEditingController();
  final locationValueHolder = TextEditingController();
  final ageValueHolder = TextEditingController();
  final sexValueHolder = TextEditingController();
  String firstName = "";
  String lastName = "";
  String password = "";
  String phone = "";
  String email = "";
  String location = "";
  String age = "";
  String sex = "";
  String usertype = "General user";
  var gender = 'Male';
  var isLoading = false;

  getTextInputData() {
    setState(() {
      firstName = firstNameValueHolder.text;
      lastName = lastNameValueHolder.text;
      password = passValueHolder.text;
      phone = phoneValueHolder.text;
      email = emailValueHolder.text;
      location = locationValueHolder.text;
      age = ageValueHolder.text;
      sex = sexValueHolder.text;

      checkValue(context);


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

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
    // TODO: implement build
    Widget _Bgap() {
      return Container(height: 120.0, color: Colors.white);
    }

    Widget _Sgap() {
      return Container(height: 50.0, color: Colors.white);
    }

    Widget _head() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Register", style: TextStyles.h1Style),
          Text("Please fill out the form", style: TextStyles.body),
        ],
      ).p16;
    }

    Widget _helpText() {
      return Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 10.0,
          children: <Widget>[
            Text("Already have account?").vP8,
            GestureDetector(
              onTap: () {
                // do what you need to do when "Click here" gets clicked
                setState(() {
                  print("Login clicked");
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                });
              },
              child: Text("Login",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: ColorResources.themered,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
            ).vP8,
          ]);
    }

    Widget _LoginInputs() {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //user name
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ColorResources.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: firstNameValueHolder,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "First name",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child:
                          Icon(Icons.account_circle, color: ColorResources.themered)
                              .alignCenter
                              .ripple(() {},
                                  borderRadius: BorderRadius.circular(13))),
                ),
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ColorResources.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: lastNameValueHolder,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "Last name",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child:
                          Icon(Icons.account_circle, color: ColorResources.themered)
                              .alignCenter
                              .ripple(() {},
                                  borderRadius: BorderRadius.circular(13))),
                ),
              ),
            ),
            //User phone
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ColorResources.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: phoneValueHolder,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "phone",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child: Icon(Icons.phone, color: ColorResources.themered)
                          .alignCenter
                          .ripple(() {},
                              borderRadius: BorderRadius.circular(13))),
                ),
              ),
            ),
            //email
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ColorResources.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: emailValueHolder,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child: Icon(Icons.email, color: ColorResources.themered)
                          .alignCenter
                          .ripple(() {},
                              borderRadius: BorderRadius.circular(13))),
                ),
              ),
            ),
//password
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ColorResources.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: passValueHolder,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child: Icon(Icons.lock, color: ColorResources.themered)
                          .alignCenter
                          .ripple(() {},
                              borderRadius: BorderRadius.circular(13))),
                ),
              ),
            ),

            //Location
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ColorResources.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: locationValueHolder,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "Loacation",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                    width: 55,
                    child: Icon(Icons.my_location, color: ColorResources.themered)
                        .alignCenter
                        .ripple(() {}, borderRadius: BorderRadius.circular(13)),
                  ),
                ),
                onTap: () {
                  // _getCurrentLocation();
                  final Geolocator geolocator = Geolocator()
                    ..forceAndroidLocationManager;

                  geolocator
                      .getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.best)
                      .then((Position position) async {
                    setState(() {
                      _currentPosition = position;
                    });

                    final coordinates = new Coordinates(
                        _currentPosition.latitude, _currentPosition.longitude);
                    var addresses = await Geocoder.local
                        .findAddressesFromCoordinates(coordinates);
                    var first = addresses.first;
                    print("${first.featureName} : ${first.addressLine}");
                    locationValueHolder.text = '${first.addressLine}';
                    print(
                        "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}");
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
            ),
            //Age
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ColorResources.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: ageValueHolder,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "dd/mm/yyyy",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child:
                          Icon(Icons.filter_vintage, color: ColorResources.themered)
                              .alignCenter
                              .ripple(() {},
                                  borderRadius: BorderRadius.circular(13))),
                ),
              ),
            ),
            //Gender
            Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: ColorResources.grey.withOpacity(.3),
                      blurRadius: 15,
                      offset: Offset(3, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = 'Male';
                          });
                        },
                        child: Container(
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(13),
                                  bottomLeft: Radius.circular(13)),
                              color: gender == 'Male'
                                  ? Colors.black
                                  : Colors.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.accessibility,
                                size: 24,
                                color: gender == 'Male'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                      color: gender == 'Male'
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = 'Female';
                          });
                        },
                        child: Container(
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(13),
                                  bottomRight: Radius.circular(13)),
                              color: gender == 'Female'
                                  ? Colors.black
                                  : Colors.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.pregnant_woman,
                                size: 24,
                                color: gender == 'Female'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                    color: gender == 'Female'
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            _Sgap(),
            Container(
                child: SizedBox(
              width: 200.00,
              height: 55,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: ColorResources.themered)),
                onPressed: getTextInputData,
                color: ColorResources.themered,
                textColor: Colors.white,
                child: Text("Register".toUpperCase(),
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            )),
          ],
        ),
      );
    }

    //gettin current location
    _getCurrentLocation() {
      final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
    }

    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        _Sgap(),
                        _head(),
                        _LoginInputs(),
                        _Sgap(),
                        _helpText(),
                        //  _loginForm(),
                      ],
                    ),
                  ),
                  //_doctorsList()
                ],
              ),
            ),
            loading(context),
          ],
        ),
      ),
    );
  }

  void checkValue(BuildContext context) {
    if (firstName.toString().isEmpty) {
      showSnakbar(context, 'Enter first name');
    } else if (email.toString().isEmpty) {
      showSnakbar(context, 'Enter your email');
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      showSnakbar(context, 'Enter valid email');
    } else if (phone.toString().isEmpty) {
      showSnakbar(context, 'Enter your phone');
    } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phone)) {
      showSnakbar(context, 'Enter valid phone number');
    } else if (password.toString().isEmpty) {
      showSnakbar(context, 'Enter your password');
    } else if (password.length < 6) {
      showSnakbar(context, 'Enter at least 6 digit password');
    } else if (location.toString().isEmpty) {
      showSnakbar(context, 'Enter location');
    } else if (age.toString().isEmpty) {
      showSnakbar(context, 'Enter your age');
    }else{
      sendDatatoDb();
    }
  }

  void showSnakbar(BuildContext context, String message) {
    print('lkasda');
    scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: ColorResources.themered,
        content: new Text(
          message,
          style: TextStyle(color: ColorResources.white),
        )));
  }

  void sendDatatoDb() async{
    setState(() {
      isLoading = true;
    });
    
    RegistrationResponse response = await authViewModel.saveRegistration(new Registration('$firstName $lastName', firstName, lastName, email, phone, password, location, gender, age));
    if(response != null){
      setState(() {
        isLoading = false;
      });
      showSnakbar(context, '${response.message}');
      if(response.success){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginPage()));

      }
    }
  }
}

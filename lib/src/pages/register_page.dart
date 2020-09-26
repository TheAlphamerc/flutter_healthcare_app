import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

import '../theme/light_color.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
  }

  final userValueHolder = TextEditingController();
  final passValueHolder = TextEditingController();
  final phoneValueHolder = TextEditingController();
  final emailValueHolder = TextEditingController();
  final locationValueHolder = TextEditingController();
  final ageValueHolder = TextEditingController();
  final sexValueHolder = TextEditingController();
  String user = "";
  String password = "";
  String phone = "";
  String email = "";
  String location = "";
  String age = "";
  String sex = "";
  String usertype = "General user";
  var gender = 'Male';


  getTextInputData() {
    setState(() {
      user = userValueHolder.text;
      password = passValueHolder.text;
      phone = phoneValueHolder.text;
      email = emailValueHolder.text;
      location = locationValueHolder.text;
      age = ageValueHolder.text;
      sex = sexValueHolder.text;
      print(user + password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    color: LightColor.themered,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
            ).vP8,
          ]);
    }

    Widget _userSelection() {
      return Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        spacing: 10.0,
        children: <Widget>[
          Text(
            "I am a",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: LightColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ).vP8,
          GestureDetector(
            onTap: () {
              // do what you need to do when "Click here" gets clicked
              setState(() {
                print("general user select");
                usertype = "General user";
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RegisterPage()));
              });
            },
            child: Text("General user",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: usertype == "General user" ? LightColor.themered :LightColor.iconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )),
          ).vP8,
          Text("/").vP8,
          GestureDetector(
            onTap: () {
              // do what you need to do when "Click here" gets clicked
              setState(() {
                print("Doctor user select");
                usertype = "Doctor";
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RegisterPage()));
              });
            },
            child: Text("Doctor",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: usertype == "Doctor" ? LightColor.themered :LightColor.iconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )),
          ).vP8,
        ],
      );
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
                    color: LightColor.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: userValueHolder,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "User name",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child:
                          Icon(Icons.account_circle, color: LightColor.themered)
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
                    color: LightColor.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: phoneValueHolder,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "phone",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child: Icon(Icons.phone, color: LightColor.themered)
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
                    color: LightColor.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: emailValueHolder,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child: Icon(Icons.email, color: LightColor.themered)
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
                    color: LightColor.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: TextField(
                controller: passValueHolder,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child: Icon(Icons.lock, color: LightColor.themered)
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
                    color: LightColor.grey.withOpacity(.3),
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
                    child: Icon(Icons.my_location, color: LightColor.themered)
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
                    color: LightColor.grey.withOpacity(.3),
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
                  hintText: "Age",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child:
                          Icon(Icons.filter_vintage, color: LightColor.themered)
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
                      color: LightColor.grey.withOpacity(.3),
                      blurRadius: 15,
                      offset: Offset(3, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            gender = 'Male';
                          });
                        },
                        child: Container(
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(13),bottomLeft:Radius.circular(13)),
                            color:gender == 'Male'? Colors.black : Colors.white
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.accessibility,
                              size: 24,
                                color: gender == 'Male'? Colors.white : Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:5.0),
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                    color: gender == 'Male'? Colors.white : Colors.black,
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
                        onTap: (){
                          setState(() {
                            gender = 'Female';
                          });
                        },
                        child: Container(
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight:Radius.circular(13),bottomRight:Radius.circular(13)),
                              color: gender == 'Female'? Colors.black : Colors.white
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.pregnant_woman,
                                size: 24,
                                color: gender == 'Female'? Colors.white : Colors.black,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                    color: gender == 'Female'? Colors.white : Colors.black,
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
                    side: BorderSide(color: LightColor.themered)),
                onPressed: getTextInputData,
                color: LightColor.themered,
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _Sgap(),
                _head(),
                _userSelection(),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/login_response.dart';
import 'package:flutter_healthcare_app/src/pages/bottomNavigation/dashboard_screen.dart';
import 'package:flutter_healthcare_app/src/pages/bottomNavigation/doctor_dashboard_screen.dart';
import 'package:flutter_healthcare_app/src/pages/delivery/delivery_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/viewModel/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/light_color.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthViewModel authViewModel;
  var isLoading = false;
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  final userValueHolder = TextEditingController();
  final passValueHolder = TextEditingController();

  String user = "";
  String password = "";

  checkUserField() {
    if (userValueHolder.text.isEmpty) {
      showSnakbar(context, 'Please input your email');
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(userValueHolder.text)) {
      showSnakbar(context, 'Please input valid email');
    } else if (passValueHolder.text.isEmpty) {
      showSnakbar(context, 'Please input your password');
    } else {
      getTextInputData();
    }
  }

  getTextInputData() {
    setState(() {
      user = userValueHolder.text;
      password = passValueHolder.text;
      print(user + password);

      checkUser(user, password);

      if (userValueHolder.text == 'doc' && passValueHolder.text == 'doc') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => DoctorDashboardScreen()));
      }
      if (userValueHolder.text == 'user' && passValueHolder.text == 'user') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => DashboardScreen()));
      }
      if (userValueHolder.text == 'delivery' &&
          passValueHolder.text == 'delivery') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => DeliveryHomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
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
          Text("Welcome,", style: TextStyles.h1Style),
          Text("Please login to access", style: TextStyles.body),
        ],
      ).p16;
    }

    Widget _helpText() {
      return Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 20.0,
          children: <Widget>[
            Text("Don't have account?").vP8,
            GestureDetector(
              onTap: () {
                // do what you need to do when "Click here" gets clicked
                setState(() {
                  print("Register clicked");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => RegisterPage()));
                });
              },
              child: Text("Register",
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
                controller: userValueHolder,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: "User name or email",
                  hintStyle: TextStyles.body.subTitleColor,
                  suffixIcon: SizedBox(
                      width: 55,
                      child: Icon(Icons.account_circle,
                              color: ColorResources.themered)
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
                controller: passValueHolder,
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
            _Sgap(),
            Container(
                child: SizedBox(
              width: 200.00,
              height: 55,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: ColorResources.themered)),
                onPressed: checkUserField,
                color: ColorResources.themered,
                textColor: Colors.white,
                child:
                    Text("Login".toUpperCase(), style: TextStyle(fontSize: 14)),
              ),
            )),
          ],
        ),
      );
    }

    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      _Bgap(),
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
          loading(context)
        ],
      ),
    );
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

  void checkUser(String user, String password) async {
    setState(() {
      isLoading = true;
    });

    List<LoginResponse> loginResponse =
        await authViewModel.getlogin(user, password);

    if (loginResponse != null) {
      setState(() {
        isLoading = false;
      });

      if(loginResponse[0].id.isNotEmpty){
        saveDataIntoSharedPref(loginResponse[0]);

        if (loginResponse[0].usertype == 'Patient') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => DashboardScreen()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => DoctorDashboardScreen()));
        }
      }else{
        showSnakbar(context, 'Invalid username or password');
      }

    } else {
      setState(() {
        isLoading = false;
      });
      showSnakbar(context, 'Invalid username or password');
    }
  }

  void showSnakbar(BuildContext context, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: ColorResources.themered,
        content: new Text(
          message,
          style: TextStyle(color: ColorResources.white),
        )));
  }

  void saveDataIntoSharedPref(LoginResponse loginResponse) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    customerInfo.setString('id', loginResponse.id);
    customerInfo.setString('firstName', loginResponse.firstName);
    customerInfo.setString('lastName', loginResponse.lastName);
    customerInfo.setString('userType', loginResponse.usertype);
    customerInfo.setString('email', loginResponse.email);
    customerInfo.setString('userPhone', loginResponse.userphone);
    customerInfo.setString('gender', loginResponse.gender);
    customerInfo.setString('address', loginResponse.address);

  }
}

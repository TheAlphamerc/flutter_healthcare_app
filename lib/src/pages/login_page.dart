import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/login_response.dart';
import 'package:flutter_healthcare_app/src/pages/bottomNavigation/dashboard_screen.dart';
import 'package:flutter_healthcare_app/src/pages/bottomNavigation/doctor_dashboard_screen.dart';
import 'package:flutter_healthcare_app/src/pages/delivery/delivery_page.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/viewModel/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/light_color.dart';
import '../theme/light_color.dart';
import '../theme/theme.dart';
import '../theme/theme.dart';
import 'doctor_consultant_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthViewModel authViewModel;


  @override
  void initState() {
    super.initState();
  }

  final userValueHolder = TextEditingController();
  final passValueHolder = TextEditingController();

  String user = "";
  String password = "";

  getTextInputData() {
    setState(() {
      user = userValueHolder.text;
      password = passValueHolder.text;
      print(user + password);

      checkUser(user,password);

      if(userValueHolder.text == 'doc' && passValueHolder.text =='doc'){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => DoctorDashboardScreen()));
      }
      if(userValueHolder.text == 'user' && passValueHolder.text =='user'){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => DashboardScreen()));
      }
      if(userValueHolder.text == 'delivery' && passValueHolder.text =='delivery'){
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
                onPressed: getTextInputData,
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
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
    );
  }

  void checkUser(String user, String password) async {
    List<LoginResponse> loginResponse = await authViewModel.getlogin(user, password);

    if(loginResponse != null){
      saveDataIntoSharedPref(loginResponse[0]);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => DashboardScreen()));
    }

  }

  void saveDataIntoSharedPref(LoginResponse loginResponse) async{
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    customerInfo.setString('id', loginResponse.id);
    customerInfo.setString('firstName', loginResponse.firstName);
    customerInfo.setString('lastName', loginResponse.lastName);
    customerInfo.setString('userType', loginResponse.usertype);



  }
}

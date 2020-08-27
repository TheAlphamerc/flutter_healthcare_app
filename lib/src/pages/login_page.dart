import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/home_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';

import '../theme/light_color.dart';
import '../theme/light_color.dart';
import '../theme/theme.dart';
import '../theme/theme.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState   createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {
  @override
  void initState() {

    super.initState();
  }
  final userValueHolder = TextEditingController();
  final passValueHolder = TextEditingController();

  String user=""; String password="";
  getTextInputData(){

    setState(() {
      user = userValueHolder.text;
      password = passValueHolder.text;
      print(user+password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _Bgap(){
      return Container(height: 120.0, color: Colors.white); }
    Widget _Sgap(){
      return Container(height: 50.0, color: Colors.white);}

    Widget _head(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Text("Welcome,", style: TextStyles.h1Style),
          Text("Please login to access", style: TextStyles.body),
        ],
      ).p16;
    }
    Widget _helpText(){
      return Wrap (

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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RegisterPage()));
        });
      },

      child: Text("Register", style: TextStyle(decoration: TextDecoration.none,
      color:  LightColor.themered, fontWeight: FontWeight.bold,
      fontSize: 14, )),

      ).vP8,
      ]
      );

    }
    Widget _LoginInputs(){

     return Container (
       alignment: Alignment.center,
       child: Column (
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
               color: LightColor.grey.withOpacity(.3),
               blurRadius: 15,
               offset: Offset(3, 3),
             )
           ],
         ),

         child:
         TextField(
           controller: userValueHolder,
           decoration: InputDecoration(
             contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
             border: InputBorder.none,
             hintText: "User name or email",
             hintStyle: TextStyles.body.subTitleColor,

             suffixIcon: SizedBox(
                 width: 55,
                 child: Icon(Icons.account_circle, color: LightColor.themered)
                     .alignCenter
                     .ripple(() {}, borderRadius: BorderRadius.circular(13))),
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
                   color: LightColor.grey.withOpacity(.3),
                   blurRadius: 15,
                   offset: Offset(3, 3),
                 )
               ],
             ),

             child:
             TextField(
               controller: passValueHolder,
                 obscureText:true,
                 decoration: InputDecoration(
                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                 border: InputBorder.none,
                 hintText: "Password",
                 hintStyle: TextStyles.body.subTitleColor,
                 suffixIcon: SizedBox(
                     width: 55,
                     child: Icon(Icons.lock, color: LightColor.themered)
                         .alignCenter
                         .ripple(() {}, borderRadius: BorderRadius.circular(13))),
               ),
             ),

           ),
           _Sgap(),
           Container (
             child:
               SizedBox(
                 width: 200.00,
                 height: 55,

                 child:  RaisedButton(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(13.0),
                       side: BorderSide(color: LightColor.themered)),
                   onPressed:getTextInputData,
                   color: LightColor.themered,
                   textColor: Colors.white,
                   child: Text("Login".toUpperCase(),
                       style: TextStyle(fontSize: 14)),
                 ),
               )

           ),
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


}
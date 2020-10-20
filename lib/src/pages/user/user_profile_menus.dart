import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/user/user_profile_page.dart';
import 'package:flutter_healthcare_app/src/profile/contat_information.dart';
import 'package:flutter_healthcare_app/src/profile/medical_history.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
class UserProfileMenu extends StatefulWidget {
  @override
  _UserProfileMenuState createState() => _UserProfileMenuState();
}

class _UserProfileMenuState extends State<UserProfileMenu> {
  var currentPage = 0;
  final List<Widget> _children = [
    //UserProfilePage(),
    UserProfilePage(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _Bgap() {
      return Container(height: 120.0, color: Colors.white);
    }

    Widget _Sgap() {
      return Container(height: 20.0, color: Theme.of(context).backgroundColor);
    }

    Widget _Menus(){
      return Column (
        children: <Widget>[
          GestureDetector(
            onTap: (){
              print('You clicked in Personal details');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfilePage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, top:3, bottom: 15),
              child: Row(
                  children:<Widget>[
                    Icon(Icons.account_circle, color: ColorResources.themered, size: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Personal Details', style: TextStyle (fontSize: 18),),
                    ),
                ]
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('You clicked in Contact Info details');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactInfo()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, top:3, bottom: 15),
              child: Row(
                  children:<Widget>[
                    Icon(Icons.contact_mail, color: ColorResources.themered, size: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Contact Information', style: TextStyle (fontSize: 18),),
                    ),
                  ]
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('You clicked in History Info details');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MedicalHistory()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, top:3, bottom: 15),
              child: Row(
                  children:<Widget>[
                    Icon(Icons.history, color: ColorResources.themered, size: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Medical history', style: TextStyle (fontSize: 18),),
                    ),
                  ]
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('You clicked in Payment Info details');
            },
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, top:3, bottom: 15),
              child: Row(
                  children:<Widget>[
                    Icon(Icons.payment, color: ColorResources.themered, size: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Payment', style: TextStyle (fontSize: 18),),
                    ),
                  ]
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('You clicked in Purchase Info details');
            },
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, top:3, bottom: 15),
              child: Row(
                  children:<Widget>[
                    Icon(Icons.shopping_cart, color: ColorResources.themered, size: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Purchase list', style: TextStyle (fontSize: 18),),
                    ),
                  ]
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('You clicked in Active memmber');
            },
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, top:3, bottom: 15),
              child: Row(
                  children:<Widget>[
                    Icon(Icons.verified_user, color: ColorResources.themered, size: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Active member code', style: TextStyle (fontSize: 18),),
                    ),
                  ]
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('You clicked in Purchase Info details');
            },
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, top:50, bottom: 15),
              child: Row(
                  children:<Widget>[
                    Icon(Icons.exit_to_app, color: ColorResources.themered, size: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Logout', style: TextStyle (fontSize: 18),),
                    ),
                  ]
              ),
            ),
          ),
        ],

      );
    }


    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text('App Name', style: TextStyle (color: ColorResources.themered),),
      ),
      body:
      CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _Sgap(),
                _Menus(),
                _Sgap(),

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

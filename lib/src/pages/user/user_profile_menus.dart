import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/lab_test_view_screen.dart';
import 'package:flutter_healthcare_app/src/pages/purchase_screen.dart';
import 'package:flutter_healthcare_app/src/pages/splash_page.dart';
import 'package:flutter_healthcare_app/src/pages/user/profile_screen.dart';
import 'package:flutter_healthcare_app/src/profile/contat_information.dart';
import 'package:flutter_healthcare_app/src/profile/medical_history.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserProfileMenu extends StatefulWidget {
  @override
  _UserProfileMenuState createState() => _UserProfileMenuState();
}

class _UserProfileMenuState extends State<UserProfileMenu> {
  var currentPage = 0;
  final List<Widget> _children = [
    //UserProfilePage(),
    ProfileScreen(),
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PurchaseScreen()));
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LabTestViewPage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left:20.0, top:3, bottom: 15),
              child: Row(
                  children:<Widget>[
                    Icon(Icons.history_edu, color: ColorResources.themered, size: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Lab Test Summary', style: TextStyle (fontSize: 18),),
                    ),
                  ]
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              openConfirmationDialog(context);
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
        backgroundColor: ColorResources.themered,
        centerTitle: true,
        title: Text('M Care ', style: TextStyle (color: ColorResources.white),),
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


  void openConfirmationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Do you want to logout?',
                            style: TextStyle(
                              color: ColorResources.lightblack,
                            ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: ColorResources.themered,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: ()=>Navigator.pop(context),
                                child: Container(
                                  child: Center(
                                    child: Text('No',
                                      style: TextStyle(
                                          color: ColorResources.lightOrange
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: ()=>logOutFuntion(context),
                                child: Container(
                                  child: Center(
                                    child: Text('Yes',
                                      style: TextStyle(
                                          color: ColorResources.themered
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  logOutFuntion(BuildContext context) async{
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    customerInfo.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>
            SplashPage()), (Route<dynamic> route) => false);

  }
}

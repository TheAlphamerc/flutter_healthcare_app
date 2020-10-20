import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';

class DrawerWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerWidget({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/4,
                color: ColorResources.lightblack,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: ColorResources.themered,
                  child: Padding(
                    padding: const EdgeInsets.only(top:70.0,left:20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: ColorResources.white,
                            fontSize: 25,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:6.0,bottom:6.0),
                          child: Text(
                            'Appointment',
                            style: TextStyle(
                                color: ColorResources.white,
                                fontSize: 25,
                            ),
                          ),
                        ),
                        Text(
                          'My Cart',
                          style: TextStyle(
                              color: ColorResources.white,
                              fontSize: 25,
                          ),
                        ),


                      ],
                    ),
                  ),

                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/4 - 50,
                  child: SizedBox(
                  width: 250,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: Image.asset('assets/user.png',
                            fit: BoxFit.fill,
                        height: 100,
                        width: 100,),
                      ),
                    ),
                  )),
              Positioned(
                bottom: 50,
                left: 20,
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: ColorResources.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

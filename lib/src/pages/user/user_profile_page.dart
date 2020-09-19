import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
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
              color: LightColor.themered,
              child: Center(
                child: Text(
                  'profile',
                  style: TextStyle(color: LightColor.white, fontSize: 18),
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: body(context),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width/2 - 50,
              right: MediaQuery.of(context).size.width/2 - 50,
              top: 100,
              child: profileImage(context),
            )
          ],
        ),
      ),
    );
  }

  Widget profileImage(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: LightColor.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        border: Border.all(color: LightColor.themered, width: 3)
      ) ,
    );
  }

  Widget body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top:50.0,left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('First name',
              style: TextStyle(
                fontSize: 16,
                color: LightColor.lightblack
              ),),
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: Text('Md',
                  style: TextStyle(
                      fontSize: 18,
                      color: LightColor.black
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Divider(
                  color: LightColor.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text('Last name',
                style: TextStyle(
                    fontSize: 16,
                    color: LightColor.lightblack
                ),),
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: Text('Arafat',
                  style: TextStyle(
                      fontSize: 18,
                      color: LightColor.black
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Divider(
                  color: LightColor.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text('Email',
                style: TextStyle(
                    fontSize: 16,
                    color: LightColor.lightblack
                ),),
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: Text('arafat@gmail.com',
                  style: TextStyle(
                      fontSize: 18,
                      color: LightColor.black
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Divider(
                  color: LightColor.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text('Date of birth',
                style: TextStyle(
                    fontSize: 16,
                    color: LightColor.lightblack
                ),),
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: Text('11 FEb, 1985',
                  style: TextStyle(
                      fontSize: 18,
                      color: LightColor.black
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Divider(
                  color: LightColor.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text('Address',
                style: TextStyle(
                    fontSize: 16,
                    color: LightColor.lightblack
                ),),
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: Text('Dhanmondi',
                  style: TextStyle(
                      fontSize: 18,
                      color: LightColor.black
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Divider(
                  color: LightColor.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text('Identification card',
                style: TextStyle(
                    fontSize: 16,
                    color: LightColor.lightblack
                ),),
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: Text('',
                  style: TextStyle(
                      fontSize: 18,
                      color: LightColor.black
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Divider(
                  color: LightColor.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

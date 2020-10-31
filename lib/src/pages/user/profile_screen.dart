import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var id = '';
  var firstName = '';
  var lastName = '';
  var email = '';
  var address = '';
  var phone = '';
  var gender = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.themered,
        elevation: 0,
        leading: GestureDetector(
          onTap: ()=>Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: ColorResources.themered,
            ),
            Positioned(
              top: 50,
              child: body(context),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 50,
              right: MediaQuery.of(context).size.width / 2 - 50,
              top: 0,
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
          color: ColorResources.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          border: Border.all(color: ColorResources.themered, width: 3)),
      child: Center(
        child: Icon(Icons.account_circle_rounded,
        size: 80,),
      ) ,
    );
  }

  Widget body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'First name',
                style:
                    TextStyle(fontSize: 16, color: ColorResources.lightblack),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '$firstName',
                  style: TextStyle(fontSize: 18, color: ColorResources.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  color: ColorResources.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text(
                'Last name',
                style:
                    TextStyle(fontSize: 16, color: ColorResources.lightblack),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '$lastName',
                  style: TextStyle(fontSize: 18, color: ColorResources.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  color: ColorResources.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text(
                'Email',
                style:
                    TextStyle(fontSize: 16, color: ColorResources.lightblack),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '${email != null ? email:''}',
                  style: TextStyle(fontSize: 18, color: ColorResources.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  color: ColorResources.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text(
                'Phone',
                style:
                    TextStyle(fontSize: 16, color: ColorResources.lightblack),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '${phone != null? phone:''}',
                  style: TextStyle(fontSize: 18, color: ColorResources.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  color: ColorResources.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text(
                'Address',
                style:
                    TextStyle(fontSize: 16, color: ColorResources.lightblack),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '${address != null ? address:''}',
                  style: TextStyle(fontSize: 18, color: ColorResources.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  color: ColorResources.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
              Text(
                'Gender',
                style:
                    TextStyle(fontSize: 16, color: ColorResources.lightblack),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '${ gender != null   ? gender:''}',
                  style: TextStyle(fontSize: 18, color: ColorResources.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  color: ColorResources.lightblack.withOpacity(0.5),
                  thickness: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getUserInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    setState(() {
      id = customerInfo.getString('id');
      firstName = customerInfo.getString('firstName');
      lastName = customerInfo.getString('lastName');
      email = customerInfo.getString('email');
      phone = customerInfo.getString('userPhone');
      gender = customerInfo.getString('gender');
      address = customerInfo.getString('address');
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/contact_details.dart';

import 'package:flutter_healthcare_app/src/model/emergency_contact.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  AuthViewModel authViewModel;
  var userId;
  var isLoading = false;

  List<String> emergencyList = new List<String>();
  List<TextEditingController> emergencyContactPersonList = new List();
  List<TextEditingController> emergencyContactNumber = new List();
  TextEditingController postalCodeController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emergencyList.add('emergency');
    getCustomerInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorResources.themered,
            )),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Contact Information',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
      body: contactBody(context),
    );
  }

  contactBody(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 10,
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact information\n',
                    style: TextStyle(
                        fontSize: 18,
                        color: ColorResources.themered,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Please fill the below details\n',
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorResources.lightblack,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'Our doctors can directly provide emergency service to your location, if necessary',
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorResources.black,
                        fontWeight: FontWeight.normal),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  TextFormField(
                    controller: postalCodeController,
                    decoration: InputDecoration(
                      labelText: "My postal code",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Postal code can't be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 7.0)),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      labelText: "My Phone number",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Phone number can't be left blank";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 7.0)),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: "My Address",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Address can't be left blank";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Text(
                    'On emergency',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Divider(),
                  emergencyList != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: emergencyList.length,
                          itemBuilder: (context, index) {
                            for (int i = 0; i < emergencyList.length; i++) {
                              emergencyContactPersonList
                                  .add(new TextEditingController());
                              emergencyContactNumber
                                  .add(new TextEditingController());
                            }
                            return emergencyWidgetItem(context, index);
                          },
                        )
                      : 0,
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        emergencyList.add('a');
                      });
                    },
                    color: ColorResources.themered,
                    child: Text(
                      'Add+',
                      style: TextStyle(color: ColorResources.white),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          side: BorderSide(color: Colors.white),
                        ),
                        onPressed: () {
                          if(postalCodeController.text.isEmpty){
                            showSnakbar(context, 'Please enter postal code');
                          }else if(phoneNumberController.text.isEmpty){
                            showSnakbar(context, 'Please enter phone number');
                          }else if(addressController.text.isEmpty){
                            showSnakbar(context, 'Please enter address');
                          }else{
                            saveContact(context);
                          }


    } ,
                        color: ColorResources.themered,
                        child: Text('Save',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                ],
              ),
            ),
          ),
        ),
        loading(context)
      ],
    );
  }

  Widget emergencyWidgetItem(BuildContext context, int index) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '#${index + 1}',
              style: TextStyle(fontSize: 16, color: ColorResources.lightblack),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 7.0)),
        TextFormField(
          controller: emergencyContactPersonList[index],
          decoration: InputDecoration(
            labelText: "Emergency Contact person name",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide: BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          validator: (val) {
            if (val.length == 0) {
              return "Phone number can't be left blank";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 7.0)),
        TextFormField(
          controller: emergencyContactNumber[index],
          decoration: InputDecoration(
            labelText: "Emergency Contact Number",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
              borderSide: BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          validator: (val) {
            if (val.length == 0) {
              return "Phone number can't be left blank";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        Divider()
      ],
    );
  }

  void getCustomerInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    userId = customerInfo.getString('id');

    if (userId != null) {
      getContactDetails(context);
    }
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


  void showSnakbar(BuildContext context, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: ColorResources.themered,
        content: new Text(
          message,
          style: TextStyle(color: ColorResources.white),
        )));
  }

  saveContact(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    List<EmergencyContactList> emergencyContactList = new List();

    for (int i = 0; i < emergencyList.length; i++) {
      EmergencyContactList emergency = new EmergencyContactList(
          emergencycontactperson: emergencyContactPersonList[i].text,
          emergencycontactphone: emergencyContactNumber[i].text);
      emergencyContactList.add(emergency);
    }

    Emergency emergency = new Emergency(
        postcode: postalCodeController.text,
        userid: userId,
        address: addressController.text,
        userphone: phoneNumberController.text,
        createdby: userId,
        emergencyList: emergencyContactList);
    print(emergency.toJson());

    RegistrationResponse response =
        await authViewModel.saveEmergencyContact(emergency);

    if (response != null) {
      setState(() {
        isLoading = false;
      });
      Navigator.pop(context);
      print(response.message);
    }
  }

  void getContactDetails(BuildContext context) async {
    ContactDetails contactDetails =
        await authViewModel.getContactDetails(userId);

    if (contactDetails != null) {
      setState(() {
        isLoading = false;
        phoneNumberController.text = contactDetails.userphone;
        postalCodeController.text = contactDetails.postcode;
        addressController.text = contactDetails.address;
      });
      for (int i = 0; i < contactDetails.emergencyList.length; i++) {
        emergencyList.add(contactDetails.emergencyList[i].id);
        emergencyContactPersonList.add(new TextEditingController());
        emergencyContactNumber.add(new TextEditingController());
      }
      for (int i = 0; i < contactDetails.emergencyList.length; i++) {
        setState(() {
          emergencyContactPersonList[i].text =
              contactDetails.emergencyList[i].emergencycontactperson;
          emergencyContactNumber[i].text =
              contactDetails.emergencyList[i].emergencycontactphone;

        });
      }
      setState(() {
        emergencyList;
      });
    }
  }
}

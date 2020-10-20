import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Contacat Information',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
      body: contactBody(context),
    );
  }

  contactBody(BuildContext context) {
    return SafeArea(
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
              new Padding(padding: EdgeInsets.only(top: 10.0)),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "My postal code",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(9.0),
                    borderSide: new BorderSide(),
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
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 7.0)),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "My Phone number",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(9.0),
                    borderSide: new BorderSide(),
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
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 7.0)),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "My Address",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(9.0),
                    borderSide: new BorderSide(),
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
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 10.0)),
              Text('On emergency', style: TextStyle(color: Colors.black, fontSize: 14),), Divider(),
              new Padding(padding: EdgeInsets.only(top: 7.0)),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Emergency Contact person name",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(9.0),
                    borderSide: new BorderSide(),
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
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 7.0)),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Emergency Contact Number",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(9.0),
                    borderSide: new BorderSide(),
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
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),

              new Padding(padding: EdgeInsets.only(top: 15.0)),
               Center(
                 child: SizedBox(
                   width: 250,
                   height: 50,

                   child: RaisedButton(
                     shape: RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(9.0),
                       side: BorderSide(color: Colors.white),
                     ),
                    onPressed: () => print("Button Pressed"),
                     color: ColorResources.themered,
                    child: Text(
                        'Save +',
                        style: TextStyle(fontSize: 20, color:Colors.white)
                    ),
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

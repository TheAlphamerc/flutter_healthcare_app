import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:smart_select/smart_select.dart';

import 'Features.dart';

class MedicalHistory extends StatefulWidget {
  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
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
          'Medical History',
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
                'Medical History\n',
                style: TextStyle(
                    fontSize: 18,
                    color: ColorResources.themered,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'If you have any chronic illness, please choose them below or skip',
                style: TextStyle(
                    fontSize: 14,
                    color: ColorResources.black,
                    fontWeight: FontWeight.normal),
              ),
              new Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'Personal fitness',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Divider(),
              new Padding(padding: EdgeInsets.only(top: 7.0)),
              Row(children: [
                Expanded(
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Height (M)",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(9.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Provide your height";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Wight (KGs)",

                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(9.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Your weight";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ]),
              new Padding(padding: EdgeInsets.only(top: 15.0)),
              Text('Are you currently Taking any Medicine?\n'),
              Row(children: [
                Expanded(
                  child: Container(
                    height: 50,

                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        color: Colors.white,
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Text('Yes', style: TextStyle (color:Colors.black54, fontSize: 16), textAlign: TextAlign.center,)
                  ),
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                      height: 50,

                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          color: ColorResources.themered,
                        //  border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                      child: Text('No', style: TextStyle (color:Colors.white, fontSize: 16), textAlign: TextAlign.center,)
                  ),
                ),

              ]),
              new Padding(padding: EdgeInsets.only(top: 15.0)),
              Text('Any allergies or Drug Sensitivity?\n'),
              Row(children: [
                Expanded(
                  child: Container(
                      height: 50,

                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                      child: Text('Yes', style: TextStyle (color:Colors.black54, fontSize: 16), textAlign: TextAlign.center,)
                  ),
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                      height: 50,

                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          color: ColorResources.themered,
                          //  border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                      child: Text('No', style: TextStyle (color:Colors.white, fontSize: 16), textAlign: TextAlign.center,)
                  ),
                ),

              ]),
              new Padding(padding: EdgeInsets.only(top: 15.0)),
              Center(
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.white),
                    ),
                    onPressed: () => print("Button Pressed"),
                    color: ColorResources.themered,
                    child: Text('Save +',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
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

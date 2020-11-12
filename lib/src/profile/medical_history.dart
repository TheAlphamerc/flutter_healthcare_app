import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';


class MedicalHistory extends StatefulWidget {
  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  var isMedicineTaken = false;
  var isDrugSensitivity = false;
  List<String> illnessList = new List();

  TextEditingController illNameController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.themered,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorResources.white,
            )),
        centerTitle: true,
        title: Text(
          'Medical History',
          style: TextStyle(fontSize: 18, color: Colors.white),
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
            'If you have any chronic illness, please choose them below or skip',
            style: TextStyle(
                fontSize: 14,
                color: ColorResources.black,
                fontWeight: FontWeight.normal),
          ),
          new Padding(padding: EdgeInsets.only(top: 10.0)),
          choronicIlnessWidget(context),
          illnessList != null && illnessList.length > 0 ?
          Padding(
            padding: const EdgeInsets.only(top:10.0,bottom: 10),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 4)),
                physics: NeverScrollableScrollPhysics(),
                itemCount: illnessList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: ColorResources.themered,
                          ),
                          child: Center(
                              child: Text(illnessList[index],
                              style: TextStyle(
                                color: ColorResources.white,
                                fontSize: 16
                              ),)),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          child:GestureDetector(
                            onTap:(){
                              removeItem(context,illnessList[index]);
                            } ,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2
                                )
                              ),
                              child: Center(
                                child: Icon(Icons.clear,
                                color: Colors.red,),
                              ),
                            ),
                          ))
                    ],
                  );
                }),
          ):Text(''),
          Text(
          'Personal fitness',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        Divider(),
        new Padding(padding: EdgeInsets.only(top: 7.0)),
        Row(children: [
          Expanded(
            child: SizedBox(
              height: 50,
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
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
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
          ),
        ]),
        new Padding(padding: EdgeInsets.only(top: 15.0)),
        Text('Are you currently Taking any Medicine?\n'),
        Row(children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isMedicineTaken = true;
                });
              },
              child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: isMedicineTaken
                          ? ColorResources.themered
                          : ColorResources.white,
                      border: Border.all(width: 1,
                          color: isMedicineTaken
                              ? ColorResources.themered
                              : ColorResources.lightblack),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Center(child: Text('Yes', style: TextStyle(
                      color: isMedicineTaken
                          ? ColorResources.white
                          : ColorResources.lightblack, fontSize: 16),
                    textAlign: TextAlign.center,))
              ),
            ),
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isMedicineTaken = false;
                });
              },
              child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: isMedicineTaken
                          ? ColorResources.white
                          : ColorResources.themered,
                      border: Border.all(width: 1,
                          color: isMedicineTaken
                              ? ColorResources.lightblack
                              : ColorResources.themered),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Center(child: Text('No', style: TextStyle(
                      color: isMedicineTaken
                          ? ColorResources.lightblack
                          : ColorResources.white, fontSize: 16),
                    textAlign: TextAlign.center,))
              ),
            ),
          ),

        ]),
        isMedicineTaken ? Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              decoration: new InputDecoration(
                labelText: "Medicine",
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
              keyboardType: TextInputType.text,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ),
        ) : SizedBox(),
        new Padding(padding: EdgeInsets.only(top: 15.0)),
        Text('Any allergies or Drug Sensitivity?\n'),
        Row(children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDrugSensitivity = true;
                });
              },
              child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: isDrugSensitivity
                          ? ColorResources.themered
                          : ColorResources.white,
                      border: Border.all(width: 1,
                          color: isDrugSensitivity
                              ? ColorResources.themered
                              : ColorResources.lightblack),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Center(child: Text('Yes', style: TextStyle(
                      color: isDrugSensitivity
                          ? ColorResources.white
                          : ColorResources.lightblack, fontSize: 16),
                    textAlign: TextAlign.center,))
              ),
            ),
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDrugSensitivity = false;
                });
              },
              child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: isDrugSensitivity
                          ? ColorResources.white
                          : ColorResources.themered,
                      border: Border.all(width: 1,
                          color: isDrugSensitivity
                              ? ColorResources.lightblack
                              : ColorResources.themered),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Center(child: Text('No', style: TextStyle(
                      color: isDrugSensitivity
                          ? ColorResources.lightblack
                          : ColorResources.white, fontSize: 16),
                    textAlign: TextAlign.center,))
              ),
            ),
          ),

        ]),
        isDrugSensitivity ? Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              decoration: new InputDecoration(
                labelText: "Drugs",
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
              keyboardType: TextInputType.text,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ),
        ) : SizedBox(),
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
    ),)
    ,
    );
  }

  Widget choronicIlnessWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: illNameController,
                    decoration: new InputDecoration(
                      labelText: "Add chronic illness",
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
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  addIll();
                },
                child: Container(
                  child: Icon(Icons.add,
                    size: 40,
                    color: ColorResources.themered,),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void addIll() {
    if(illNameController.text.isNotEmpty){
      setState(() {
        illnessList.add(illNameController.text);
        illNameController.clear();
      });

    }
  }

  void removeItem(BuildContext context, String illness) {
    setState(() {
      illnessList.remove(illness);

    });
  }
}

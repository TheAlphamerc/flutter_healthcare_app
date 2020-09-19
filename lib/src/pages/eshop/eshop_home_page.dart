import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/model/medicine_model.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:intl/intl.dart';

class EshopHomePage extends StatefulWidget {
  @override
  _EshopHomePageState createState() => _EshopHomePageState();
}

class _EshopHomePageState extends State<EshopHomePage> {
  TextEditingController _problemController = TextEditingController();

  var fileName = 'File';
  List<Medicine> medicineListdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    medicineListdata = medicineList.map((x) => Medicine.fromJson(x)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColor.themered,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: LightColor.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 12, bottom: 12),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: LightColor.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: LightColor.lightblack.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_none,
                    color: LightColor.themered,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          headerpart(context),
          medicineTitle(context),
          Expanded(child: _medicineList(context))
        ],
      ),
    );
  }

  Widget headerpart(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: LightColor.themered,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, bottom: 10),
            child: Text(
              'E-shop',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 5),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    color: LightColor.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:15,bottom: 10),
                child: Icon(Icons.more_vert,
                color: LightColor.white,
                size: 25,),
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: LightColor.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: LightColor.lightblack.withOpacity(.3),
                                blurRadius: 15,
                                offset: Offset(5, 5),
                              )
                            ]
                        ),
                        child: Center(child: Text('Cancer',
                        style: TextStyle(
                          fontSize: 16,
                          color: LightColor.lightblack.withOpacity(0.7)

                        ),)),
                      ),
                    );

              }),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget medicineTitle(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Top medicine',
          style: TextStyle(
            color: LightColor.lightblack.withOpacity(0.7),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _medicineList(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: medicineListdata.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: LightColor.themered,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: LightColor.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/medicine_box.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: LightColor.themered.withOpacity(0.7)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:5.0),
                            child: Text(
                              '${medicineListdata[index].medicineName}',
                              style: TextStyle(
                                  color: LightColor.white, fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${medicineListdata[index].companyName}',
                            style: TextStyle(
                                color: LightColor.white, fontSize: 16),
                          ),
                          Text(
                            '${medicineListdata[index].genericName}',
                            style: TextStyle(
                                color: LightColor.white, fontSize: 16),
                          ),
                          Divider(
                            thickness: 1,
                            color: LightColor.white,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,bottom:5.0),
                                child: Text(
                                  '10 pices',
                                  style: TextStyle(
                                      color: LightColor.white, fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:15.0,bottom: 5),
                                child: Text(
                                  '\$${medicineListdata[index].price}',
                                  style: TextStyle(
                                      color: LightColor.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

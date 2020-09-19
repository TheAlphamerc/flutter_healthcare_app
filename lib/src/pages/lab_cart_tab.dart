import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class LabTab extends StatefulWidget {
  @override
  _LabTabState createState() => _LabTabState();
}

class _LabTabState extends State<LabTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left:15.0,top: 15.0,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Test name',
                style: TextStyle(
                    color: LightColor.lightblack,
                    fontSize: 18
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:4.0,bottom: 4.0),
                    child: Text('Category name',
                      style: TextStyle(
                          color: LightColor.lightblack.withOpacity(0.5),
                          fontSize: 16
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0,bottom: 4.0),
                    child: Text('10.13 \$',
                      style: TextStyle(
                          color: LightColor.themered,
                          fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                  ),
                ],
              ),
              Text('15 aug 2020 1.30 am',
                style: TextStyle(
                    color: LightColor.lightblack.withOpacity(0.5),
                    fontSize: 14
                ),)
            ],
          ),
        ),
      ),
    );
  }
}

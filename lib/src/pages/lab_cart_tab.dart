import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
              cartItem(context),
              cartItem(context),
              swapText(context),
              chargeBox(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget cartItem(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Padding(
        padding: const EdgeInsets.only(bottom:10.0),
        child: Container(
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
      secondaryActions: <Widget>[

        IconSlideAction(
          onTap: (){},
          color: Colors.transparent,
          iconWidget: Container(
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
                Icons.clear,
                color: LightColor.themered,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget swapText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.keyboard_backspace,
          color: LightColor.grey,),
          Text('Drag and swap left to remove',
          style: TextStyle(
            color: LightColor.grey
          ),)
        ],
      ),
    );
  }

  Widget chargeBox(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: LightColor.white,
          border: Border.all(color: LightColor.themered,width: 2)
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              color: LightColor.themered,
              child: Text(''),
            )
          ],
        ),

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/checkout_page.dart';
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
                    color: ColorResources.lightblack,
                    fontSize: 18
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:4.0,bottom: 4.0),
                    child: Text('Category name',
                      style: TextStyle(
                          color: ColorResources.lightblack.withOpacity(0.5),
                          fontSize: 16
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4.0,bottom: 4.0),
                    child: Text('10.13 \$',
                      style: TextStyle(
                          color: ColorResources.themered,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ],
              ),
              Text('15 aug 2020 1.30 am',
                style: TextStyle(
                    color: ColorResources.lightblack.withOpacity(0.5),
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
              color: ColorResources.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  color: ColorResources.lightblack.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.clear,
                color: ColorResources.themered,
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
          color: ColorResources.grey,),
          Text('Drag and swap left to remove',
          style: TextStyle(
            color: ColorResources.grey
          ),)
        ],
      ),
    );
  }

  Widget chargeBox(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: ColorResources.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
          border: Border.all(color: ColorResources.themered,width: 2)
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              color: ColorResources.themered,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: Text(
                      'Service charge \$ 5.00',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: ColorResources.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Lab test',
                  style: TextStyle(
                    color: ColorResources.lightblack,
                    fontSize: 18
                  ),),
                  Text('20.26 \$',
                    style: TextStyle(
                        color: ColorResources.lightblack,
                        fontSize: 18
                    ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8,top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Medicine',
                    style: TextStyle(
                        color: ColorResources.lightblack,
                        fontSize: 18
                    ),),
                  Text('50.04 \$',
                    style: TextStyle(
                        color: ColorResources.lightblack,
                        fontSize: 18
                    ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8,top: 8,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('E-shop',
                    style: TextStyle(
                        color: ColorResources.lightblack,
                        fontSize: 18
                    ),),
                  Text('20.40 \$',
                    style: TextStyle(
                        color: ColorResources.lightblack,
                        fontSize: 18
                    ),),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: ColorResources.themered,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text('\$ 33.90',
                    style: TextStyle(
                      color: ColorResources.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_upward,
                    size: 25,
                    color: ColorResources.white,),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CheckoutPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text('Checkout',
                        style: TextStyle(
                            color: ColorResources.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}

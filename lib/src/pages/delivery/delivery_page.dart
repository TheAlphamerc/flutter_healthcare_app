import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class DeliveryHomePage extends StatefulWidget {
  @override
  _DeliveryHomePageState createState() => _DeliveryHomePageState();
}

class _DeliveryHomePageState extends State<DeliveryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: Icon(
          Icons.menu,
          color: ColorResources.lightblack.withOpacity(0.7),
        ),
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
              color: ColorResources.lightblack.withOpacity(0.7), fontSize: 18),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15),
              child: Text(
                'Hello',
                style: TextStyle(color: ColorResources.grey, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5),
              child: Text(
                'Mr. Peter',
                style: TextStyle(
                    color: ColorResources.lightblack,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            deliveryRequest(context)
          ],
        ),
      ),
    );
  }

  Widget deliveryRequest(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 10),
          child: Text(
            'Delivery request',
            style: TextStyle(
                color: ColorResources.themered,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 180,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left:15,right: 15,bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: ColorResources.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: ColorResources.lightblack.withOpacity(.3),
                            blurRadius: 15,
                            offset: Offset(5, 5),
                          )
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Medicine item',
                                style: TextStyle(
                                    color: ColorResources.lightblack, fontSize: 18),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, right: 10),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: ColorResources.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    border:
                                        Border.all(color: ColorResources.themered),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorResources.lightblack
                                            .withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 15,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.visibility,
                                      color: ColorResources.themered,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '#12367894',
                                style: TextStyle(
                                    color: ColorResources.lightblack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 15, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icon-truck.png',
                                      height: 15,
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Pickup',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResources.lightblack),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Delivery',
                                  style: TextStyle(
                                      fontSize: 16, color: ColorResources.lightblack),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 15, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "43, Jhonson height New Orlinse, USA",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          ColorResources.lightblack.withOpacity(0.6)),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "43, Loram Ipsum NY, USA\n",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          ColorResources.lightblack.withOpacity(0.6)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: ColorResources.themered),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Decline',
                                style: TextStyle(
                                    color: ColorResources.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30.0, right: 15),
                                child: Text(
                                  'Accept',
                                  style: TextStyle(
                                      color: ColorResources.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}

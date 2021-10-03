import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        leading: Icon(Icons.menu,
        color: ColorResources.black,),
        title: Text('Notifications',
        style: TextStyle(
          color: ColorResources.grey,
          fontSize: 18
        ),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            recentItem(context),
            missedItem(context)
          ],
        ),
      ),
    );
  }

  Widget recentItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('Recent',
            style: TextStyle(
                fontSize: 18,
                color: ColorResources.lightblack.withOpacity(0.7),
                fontWeight: FontWeight.bold
            ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 10),
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
                ]
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  child: Image.asset('assets/boy_treatment.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patient name',style: TextStyle(
                          color: ColorResources.lightblack.withOpacity(0.7),
                          fontSize: 18
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:4,bottom: 4),
                          child: Text('Male, 30 years',style: TextStyle(
                              color: ColorResources.lightblack.withOpacity(0.5),
                              fontSize: 14
                          ),),
                        ),
                        Text('Cronic disease',style: TextStyle(
                            color: ColorResources.lightblack.withOpacity(0.7),
                            fontSize: 14
                        ),),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('18',style: TextStyle(
                      fontSize: 25,
                      color: ColorResources.lightblack
                    ),),
                    Text('Aug, 2020',style: TextStyle(
                        fontSize: 14,
                        color: ColorResources.lightblack
                    ),),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.notifications_off,
                  color: ColorResources.themered,
                  size: 40,),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 10),
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
                ]
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  child: Image.asset('assets/boy_treatment.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patient name',style: TextStyle(
                            color: ColorResources.lightblack.withOpacity(0.7),
                            fontSize: 18
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:4,bottom: 4),
                          child: Text('Male, 30 years',style: TextStyle(
                              color: ColorResources.lightblack.withOpacity(0.5),
                              fontSize: 14
                          ),),
                        ),
                        Text('Cronic disease',style: TextStyle(
                            color: ColorResources.lightblack.withOpacity(0.7),
                            fontSize: 14
                        ),),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('18',style: TextStyle(
                        fontSize: 25,
                        color: ColorResources.lightblack
                    ),),
                    Text('Aug, 2020',style: TextStyle(
                        fontSize: 14,
                        color: ColorResources.lightblack
                    ),),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.notifications_off,
                    color: ColorResources.themered,
                    size: 40,),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 10),
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
                ]
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  child: Image.asset('assets/boy_treatment.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patient name',style: TextStyle(
                            color: ColorResources.lightblack.withOpacity(0.7),
                            fontSize: 18
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:4,bottom: 4),
                          child: Text('Male, 30 years',style: TextStyle(
                              color: ColorResources.lightblack.withOpacity(0.5),
                              fontSize: 14
                          ),),
                        ),
                        Text('Gives you five star on your service',style: TextStyle(
                            color: ColorResources.themered.withOpacity(0.7),
                            fontSize: 14
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget missedItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('You missed',
            style: TextStyle(
                fontSize: 18,
                color: ColorResources.lightblack.withOpacity(0.7),
                fontWeight: FontWeight.bold
            ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ColorResources.themered,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ColorResources.lightblack.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(5, 5),
                  )
                ]
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  child: Image.asset('assets/boy_treatment.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patient name',style: TextStyle(
                            color: ColorResources.white.withOpacity(0.8),
                            fontSize: 18
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:4,bottom: 4),
                          child: Text('Male, 30 years',style: TextStyle(
                              color: ColorResources.white.withOpacity(0.8),
                              fontSize: 14
                          ),),
                        ),
                        Text('Appointment canceld',style: TextStyle(
                            color: ColorResources.white,
                            fontSize: 14
                        ),),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('18',style: TextStyle(
                        fontSize: 25,
                        color: ColorResources.white
                    ),),
                    Text('Aug, 2020',style: TextStyle(
                        fontSize: 14,
                        color: ColorResources.white
                    ),),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: ColorResources.white),
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
                        color: ColorResources.white,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 10),
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
                ]
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  child: Image.asset('assets/boy_treatment.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patient name',style: TextStyle(
                            color: ColorResources.lightblack.withOpacity(0.7),
                            fontSize: 18
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:4,bottom: 4),
                          child: Text('Male, 30 years',style: TextStyle(
                              color: ColorResources.lightblack.withOpacity(0.5),
                              fontSize: 14
                          ),),
                        ),
                        Text('Appointment reschdule',style: TextStyle(
                            color: ColorResources.themered,
                            fontSize: 14
                        ),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.info,
                    color: ColorResources.themered,
                    size: 30,),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ColorResources.themered,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ColorResources.lightblack.withOpacity(.3),
                    blurRadius: 15,
                    offset: Offset(5, 5),
                  )
                ]
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  child: Image.asset('assets/boy_treatment.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patient name',style: TextStyle(
                            color: ColorResources.white.withOpacity(0.8),
                            fontSize: 18
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:4,bottom: 4),
                          child: Text('Male, 30 years',style: TextStyle(
                              color: ColorResources.white.withOpacity(0.8),
                              fontSize: 14
                          ),),
                        ),
                        Text('Appointment canceld',style: TextStyle(
                            color: ColorResources.white,
                            fontSize: 14
                        ),),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('18',style: TextStyle(
                        fontSize: 25,
                        color: ColorResources.white
                    ),),
                    Text('Aug, 2020',style: TextStyle(
                        fontSize: 14,
                        color: ColorResources.white
                    ),),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: ColorResources.white),
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
                        color: ColorResources.white,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 10),
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
                ]
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  child: Image.asset('assets/boy_treatment.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patient name',style: TextStyle(
                            color: ColorResources.lightblack.withOpacity(0.7),
                            fontSize: 18
                        ),),
                        Padding(
                          padding: const EdgeInsets.only(top:4,bottom: 4),
                          child: Text('Male, 30 years',style: TextStyle(
                              color: ColorResources.lightblack.withOpacity(0.5),
                              fontSize: 14
                          ),),
                        ),
                        Text('Appointment reschdule',style: TextStyle(
                            color: ColorResources.themered,
                            fontSize: 14
                        ),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.info,
                    color: ColorResources.themered,
                    size: 30,),
                )
              ],
            ),
          ),
        ),


      ],
    );
  }
}

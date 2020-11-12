import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.themered,
        title: Text('History',
        style: TextStyle(
          color: ColorResources.white,
          fontSize: 18
        ),),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            body(context),
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/icon-sad.png',
            width: 40,
            height: 40,),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:10.0),
            child: Text('No history found',
            style: TextStyle(color: ColorResources.lightblack.withOpacity(0.7),
            fontSize: 18),),
          ),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  List<String> getListElements() {
    var item = List<String>.generate(100, (index) => "Service ${index}");
    return item;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: LightColor.themered)),
        title: Text(
          'Services',
          style: TextStyle(color: LightColor.themered),
        ),
      ),
      body: getMenus(),
    );
  }

  /*serviceList(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height - 60,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Menu 1'),
              getMenus (),
            ],
          ),
        ),
      ),
    );
  }*/


  Widget getMenus() {
    var listmenu = getListElements();
    var listview = ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider( thickness: 1, color: LightColor.themered,),
        itemCount: listmenu.length,
        itemBuilder: (context, index) {
      return ListTile(
        title: Text('${listmenu[index]}'),
        leading: Icon(Icons.star),
        trailing: Icon(Icons.arrow_forward_ios, color: LightColor.themered,),
      );
      Divider();
    });
    return listview;
  }
}

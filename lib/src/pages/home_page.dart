import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';

import '../theme/light_color.dart';
import '../theme/light_color.dart';
import '../theme/light_color.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DoctorModel> doctorDataList;
  var selected = 'DOCTOR';
  var selectedField = 'Near by';
  var isSelectFilter = false;

  @override
  void initState() {
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: Icon(
        Icons.short_text,
        size: 30,
        color: Colors.black,
      ),
      actions: <Widget>[
        Icon(
          Icons.notifications_none,
          size: 30,
          color: LightColor.grey,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          child: Container(
            // height: 40,
            // width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Image.asset("assets/user.png", fit: BoxFit.fill),
          ),
        ).p(8),
      ],
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello,", style: TextStyles.title.subTitleColor),
        Text(
          "Peter Parker",
          style: TextStyles.title,
        ),
      ],
    ).p16;
  }

  Widget _navLinks() {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 20.0,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // do what you need to do when "Click here" gets clicked
            setState(() {
              selected = 'DOCTOR';
              print("DOCTOR");
            });
          },
          child: Text("DOCTOR",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: selected == 'DOCTOR' ? Colors.redAccent : Colors.black54,
                fontSize: 14,
              )),
        ).vP8,
        GestureDetector(
          onTap: () {
            // do what you need to do when "Click here" gets clicked
            setState(() {
              selected = 'LAB TEST';
            });
            print("LAB TEST");
          },
          child: Text("LAB TEST",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: selected == 'LAB TEST'
                      ? Colors.redAccent
                      : Colors.black54,
                  fontSize: 14)),
        ).vP8,
        GestureDetector(
          onTap: () {
            // do what you need to do when "Click here" gets clicked
            setState(() {
              selected = 'MEDICINE';
            });
            print("MEDICINE");
          },
          child: Text("MEDICINE",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: selected == 'MEDICINE'
                      ? Colors.redAccent
                      : Colors.black54,
                  fontSize: 14)),
        ).vP8,
        GestureDetector(
          onTap: () {
            // do what you need to do when "Click here" gets clicked
            setState(() {
              selected = 'E-SHOP';
            });
            print("E-SHOP");
          },
          child: Text("E-SHOP",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color:
                      selected == 'E-SHOP' ? Colors.redAccent : Colors.black54,
                  fontSize: 14)),
        ).vP8
      ],
    );
  }

  Widget _searchField() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: LightColor.lightblack.withOpacity(.3),
            blurRadius: 15,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 120,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyles.body.subTitleColor,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelectFilter == true) {
                        isSelectFilter = false;
                      } else {
                        isSelectFilter = true;
                      }
                    });
                    print(isSelectFilter);
                  },
                  child: Icon(Icons.filter_list, color: LightColor.themered)

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.search, color: LightColor.themered)
                    .alignCenter
                    .ripple(() {}, borderRadius: BorderRadius.circular(13)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _category() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Category", style: TextStyles.title.bold),
              Text(
                "See All",
                style:
                    TextStyles.titleNormal.copyWith(color: LightColor.themered),
              ).p(8).ripple(() {})
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .28,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCard("Cardiologists", "50+ doctors",
                  color: LightColor.green, lightColor: LightColor.lightGreen),
              _categoryCard("Dermatologists", "99+ Doctors",
                  color: LightColor.skyBlue, lightColor: LightColor.lightBlue),
              _categoryCard("Gastroenterologists", "50+ Doctors",
                  color: LightColor.orange, lightColor: LightColor.lightOrange),
              _categoryCard("Anesthesiologists", "15+ Doctors",
                  color: LightColor.purple, lightColor: LightColor.purpleLight)
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(String title, String subtitle,
      {Color color, Color lightColor}) {
    TextStyle titleStyle = TextStyles.bodynormal.bold.white;
    TextStyle subtitleStyle = TextStyles.bodynormal.white;
    if (AppTheme.fullWidth(context) < 392) {
      titleStyle = TextStyles.body.white;
      subtitleStyle = TextStyles.bodynormal.white;
    }
    return AspectRatio(
      aspectRatio: 6 / 8,
      child: Container(
        height: 280,
        width: AppTheme.fullWidth(context) * .3,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: lightColor.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -20,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(title, style: titleStyle).hP8,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Text(
                        subtitle,
                        style: subtitleStyle,
                      ).hP8,
                    ),
                  ],
                ).p16
              ],
            ),
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _doctorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Doctors", style: TextStyles.title.bold),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: LightColor.themered,
                  ),
                  onPressed: () {})
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
      return _doctorTile(x);
    }).toList());
  }

  Widget _doctorTile(DoctorModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.asset(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(model.name, style: TextStyles.title.bold),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.type,
                style: TextStyles.body.subTitleColor.bold,
              ),
              Text(
                model.location,
                style: TextStyles.bodySm.subTitleColor,
              ),
              Text(
                ('\$${model.constFee}'),
                style: TextStyles.bodySm.subTitleColor,
              ),

            ],
          ),

          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: LightColor.themered,
          ),
        ),
      ).ripple(() {
        Navigator.pushNamed(context, "/DetailPage", arguments: model);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Widget _basedOnField() {
    return isSelectFilter
        ? Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 20.0,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selectedField = 'Near by';
                    print("Near by");
                  });
                },
                child: Text("Near by",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: selectedField == 'Near by'
                          ? Colors.redAccent
                          : Colors.black54,
                      fontSize: 14,
                    )),
              ).vP8,
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selectedField = 'Gender';
                  });
                  print("Gender");
                },
                child: Text("Gender",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selectedField == 'Gender'
                            ? Colors.redAccent
                            : Colors.black54,
                        fontSize: 14)),
              ).vP8,
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selectedField = 'Rating';
                  });
                  print("Rating");
                },
                child: Text("Rating",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selectedField == 'Rating'
                            ? Colors.redAccent
                            : Colors.black54,
                        fontSize: 14)),
              ).vP8,
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selectedField = 'Experience';
                  });
                  print("Experience");
                },
                child: Text("Experience",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selectedField == 'Experience'
                            ? Colors.redAccent
                            : Colors.black54,
                        fontSize: 14)),
              ).vP8
            ],
          )
        : Text('');
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _header(),
                _navLinks(),

                _searchField(),
                _basedOnField(),
                //_category(),
              ],
            ),
          ),
          _doctorsList()
        ],
      ),
    );
  }
}

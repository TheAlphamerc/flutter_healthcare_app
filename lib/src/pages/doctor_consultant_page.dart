import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/viewModel/doctor_view_model.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/pages/notification_page.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/widgets/DrawerWidget.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/light_color.dart';

class DoctorConsultantPage extends StatefulWidget {
  DoctorConsultantPage({Key key}) : super(key: key);

  @override
  _DoctorConsultantPageState createState() => _DoctorConsultantPageState();
}

class _DoctorConsultantPageState extends State<DoctorConsultantPage> {
  DoctorViewModel doctorViewModel;

  List<Doctor> doctorDataList;
  List<Doctor> _searchResult = [];
  List<Doctor> filterList = [];


  TextEditingController _searchController = new TextEditingController();
  TextEditingController _experieceController = new TextEditingController();


  var selected = 'DOCTOR';
  var selectedField = 'Near by';
  var isSelectFilter = false;
  var gender = 'Male';
  var isFirst = true;
  var isLoading = true;
  double _rating = 5;
  var firstName;
  var lastName;

  final GlobalKey<ScaffoldState> _scaffoldKey_home =
      new GlobalKey<ScaffoldState>();

  List<String> _genderList = ["Male", "Female"];

  @override
  void initState() {
    super.initState();
    doctorDataList = new List();
    getCustomerInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    doctorViewModel = Provider.of<DoctorViewModel>(context);
    if (isFirst) {
      getDoctor(context,'','','','','','');
      setState(() {
        isFirst = false;
      });
    }

    return Scaffold(
      // appBar: _appBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      key: _scaffoldKey_home,
      drawer: DrawerWidget(
        scaffoldKey: _scaffoldKey_home,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        _header(),
                        //  _navLinks(),

                        _searchField(),
                        _basedOnField(),
                        //_category(),
                      ],
                    ),
                  ),
                  _doctorsList()
                ],
              ),
            ),
          ),
          loading(context)
        ],
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey_home.currentState.openDrawer();
        },
        child: Icon(
          Icons.short_text,
          size: 30,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NotificationPage()));
          },
          child: Icon(
            Icons.notifications_none,
            size: 30,
            color: ColorResources.grey,
          ),
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
          "$firstName $lastName",
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
            color: ColorResources.lightblack.withOpacity(.3),
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
              controller: _searchController,
              onChanged: onSearchTextChanged,
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
                    },
                    child: Icon(Icons.filter_list, color: ColorResources.themered)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.search, color: ColorResources.themered)
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
                    TextStyles.titleNormal.copyWith(color: ColorResources.themered),
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
                  color: ColorResources.green, lightColor: ColorResources.lightGreen),
              _categoryCard("Dermatologists", "99+ Doctors",
                  color: ColorResources.skyBlue, lightColor: ColorResources.lightBlue),
              _categoryCard("Gastroenterologists", "50+ Doctors",
                  color: ColorResources.orange, lightColor: ColorResources.lightOrange),
              _categoryCard("Anesthesiologists", "15+ Doctors",
                  color: ColorResources.purple, lightColor: ColorResources.purpleLight)
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
              // IconButton(
              //     icon: Icon(
              //       Icons.sort,
              //       color: ColorResources.themered,
              //     ),
              //     onPressed: () {})
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return doctorDataList != null
        ? SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
                itemCount: _searchResult.length >0 ? _searchResult.length: doctorDataList.length,
                itemBuilder: (context, index) {
                  return _doctorTile(_searchResult.length >0? _searchResult[index]: doctorDataList[index]);
                }),
          )
        : SizedBox(height: 100, width: 100, child: CircularProgressIndicator());
  }

  Widget _doctorTile(Doctor model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: ColorResources.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: ColorResources.grey.withOpacity(.1),
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
              ),
              child: Image.network(
                'http://172.16.61.221:8059${model.photo}',
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(model.name, style: TextStyles.title.bold),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.department,
                style: TextStyles.body.subTitleColor.bold,
              ),
              Text(
                model.education,
                style: TextStyles.bodySm.subTitleColor,
              ),
              Text(
                ('\$${model.fees}'),
                style: TextStyles.bodySm.subTitleColor,
              ),
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: ColorResources.themered,
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
                  });
                  openNearByDialog(context);
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
                  openGenderDialog(context);
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
                  openRatingDialog(context);
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
                  openExperienceDialog(context);

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
      ColorResources.orange,
      ColorResources.green,
      ColorResources.grey,
      ColorResources.lightOrange,
      ColorResources.skyBlue,
      ColorResources.titleTextColor,
      Colors.red,
      Colors.brown,
      ColorResources.purpleExtraLight,
      ColorResources.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  void openExperienceDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (contex, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.themered,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Input the year of experience',
                          style:
                              TextStyle(color: ColorResources.white, fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextField(
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                controller: _experieceController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorResources.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorResources.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorResources.white),
                                  ),
                                  counterText: '',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                ),
                              ),
                            ),
                            Text(
                              'Years',
                              style: TextStyle(
                                  color: ColorResources.white, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                              openLoading(context);
                              getDoctor(context, '', '', '', '', '',_experieceController.text);
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorResources.white,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void openRatingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (contex, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.themered,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Input the rating',
                          style:
                              TextStyle(color: ColorResources.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: RatingBar(
                          initialRating: _rating,
                          onRatingChanged: (rating) =>
                              setState(() => _rating = rating),
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          halfFilledIcon: Icons.star_half,
                          isHalfAllowed: true,
                          filledColor: ColorResources.white,
                          emptyColor: ColorResources.white,
                          halfFilledColor: ColorResources.white,
                          size: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                              openLoading(context);
                              print(gender);
                              getDoctor(context, '', '', '', '', _rating.toStringAsFixed(1),'');
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorResources.white,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void openGenderDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (contex, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.themered,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Select your gender',
                          style:
                              TextStyle(color: ColorResources.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Theme(
                          data: ThemeData(
                              primarySwatch: ColorResources.MATERIAL_WHITE),
                          child: RadioGroup<String>.builder(
                            direction: Axis.horizontal,
                            groupValue: gender,
                            onChanged: (value) => setState(() {
                              gender = value;
                              print(value);
                            }),
                            items: _genderList,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                              openLoading(context);
                              getDoctor(context, '', '', '', gender, '','');
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorResources.white,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void openNearByDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (contex, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.themered,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Input your location',
                          style:
                              TextStyle(color: ColorResources.white, fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorResources.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorResources.white),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorResources.white),
                                    ),
                                    counterText: '',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.gps_fixed,
                                size: 24,
                                color: ColorResources.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'OK',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorResources.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void getDoctor(BuildContext context, String docName, String latitude,String longitude,String gernder, String rating, String exp) async {
    List<Doctor> doctors = await doctorViewModel.getAllDoctor(docName,latitude,longitude,gernder,rating,exp);



    if (doctors != null) {
      doctorDataList.clear();
      for (Doctor doctor in doctors) {
        doctorDataList.add(doctor);
      }
      setState(() {
        doctorDataList;
        isLoading = false;
      });
    }
  }

  Widget loading(BuildContext context) {
    return isLoading
        ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: ColorResources.white.withOpacity(0.3),
        child: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorResources.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.lightBlue.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    'assets/loading.gif',
                    height: 300,
                    width: 300,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )
        : Text('');
  }

  void getCustomerInfo(BuildContext context) async{
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    setState(() {
      firstName = customerInfo.getString('firstName');
      lastName = customerInfo.getString('lastName');
    });
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    print(text);
    doctorDataList.forEach((doctor) {
      if (doctor.name.toLowerCase().contains(text.toLowerCase()) ||
          doctor.specialist.toLowerCase().contains(text.toLowerCase()) ||
          doctor.department.toLowerCase().contains(text.toLowerCase()) ||
          doctor.education.toLowerCase().contains(text.toLowerCase()))
        _searchResult.add(doctor);
    });
    print(_searchResult.length);

    setState(() {
      _searchResult;
    });
  }

  void filterGenderList(String gender) {
    _searchResult.clear();

    doctorDataList.forEach((doctor) {
      if (doctor.gender.toLowerCase().contains(gender.toLowerCase()))
        _searchResult.add(doctor);
    });

    setState(() {
      _searchResult;
    });


  }

  void openLoading(BuildContext context) {
    setState(() {
      isLoading = true;
    });
  }
}
